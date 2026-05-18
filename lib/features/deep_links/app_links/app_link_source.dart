import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_daily_practice/features/deep_links/services/deep_link_router.dart';

/// Educational companion to [CustomSchemeSource] that shows how App Links
/// (Android) and Universal Links (iOS) work — and what platform config is needed.
///
/// ─────────────────────────────────────────────────────────────────────────────
/// KEY INSIGHT
/// ─────────────────────────────────────────────────────────────────────────────
/// The [app_links] package delivers BOTH custom-scheme and HTTPS URIs through
/// the SAME [uriLinkStream]. In practice you only need ONE source class.
/// This class exists to isolate and study the HTTPS-specific flow.
///
/// ─────────────────────────────────────────────────────────────────────────────
/// ANDROID — App Links  (https://developer.android.com/training/app-links)
/// ─────────────────────────────────────────────────────────────────────────────
/// Step 1 — Add an intent-filter in AndroidManifest.xml:
///
///   [intent-filter android:autoVerify="true"]   ← THIS is what makes it an App Link
///     [action android:name="android.intent.action.VIEW" /]
///     [category android:name="android.intent.category.DEFAULT" /]
///     [category android:name="android.intent.category.BROWSABLE" /]
///     [data android:scheme="https" android:host="yourdomain.com" /]
///   [/intent-filter]
///
///   Without autoVerify → plain deep link: Android shows a disambiguation dialog.
///   With    autoVerify → App Link:        Android opens your app directly (no dialog).
///
/// Step 2 — Host a Digital Asset Links file at:
///   https://yourdomain.com/.well-known/assetlinks.json
///
///   Content-Type: application/json
///   [{
///     "relation": ["delegate_permission/common.handle_all_urls"],
///     "target": {
///       "namespace": "android_app",
///       "package_name": "com.example.flutter_daily_practice",
///       "sha256_cert_fingerprints": ["AA:BB:CC:...your signing cert SHA256..."]
///     }
///   }]
///
///   Get the debug fingerprint:
///   keytool -list -v -keystore ~/.android/debug.keystore \
///     -alias androiddebugkey -storepass android -keypass android
///
///   Verify association on a real device (Android 6+):
///   adb shell pm get-app-links com.example.flutter_daily_practice
///   → should print: yourdomain.com: verified
///
/// ─────────────────────────────────────────────────────────────────────────────
/// iOS — Universal Links  (https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app)
/// ─────────────────────────────────────────────────────────────────────────────
/// Step 1 — Add Associated Domains capability in Xcode:
///   Target → Signing & Capabilities → + Capability → Associated Domains
///   Add entry: applinks:yourdomain.com
///   (This writes to Runner.entitlements — no Info.plist change needed.)
///
/// Step 2 — Host an Apple App Site Association file at:
///   https://yourdomain.com/.well-known/apple-app-site-association
///   (No file extension. Content-Type: application/json)
///
///   {
///     "applinks": {
///       "details": [{
///         "appIDs": ["YOURTEAMID.com.example.flutter_daily_practice"],
///         "components": [
///           { "/": "/screenone*" },
///           { "/": "/screentwo*" }
///         ]
///       }]
///     }
///   }
///
/// ─────────────────────────────────────────────────────────────────────────────
/// TESTING WITHOUT A REAL SERVER
/// ─────────────────────────────────────────────────────────────────────────────
/// adb bypasses assetlinks.json verification — use it to test HTTPS URIs locally:
///
///   adb shell am start -W -a android.intent.action.VIEW \
///     -d "https://yourdomain.com/screenone?id=99" \
///     com.example.flutter_daily_practice
///
///   xcrun simctl openurl booted "https://yourdomain.com/screenone?id=99"
///
class AppLinkSource {
  final AppLinks _appLinks = AppLinks();
  final DeepLinkRouter _router;
  StreamSubscription<Uri>? _sub;

  AppLinkSource(this._router);

  Future<void> init() async {
    // Cold start — may be an HTTPS URI on Android/iOS.
    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null && _isHttps(initialUri)) {
      _router.route(initialUri);
    }

    // Warm start — filter to HTTPS only so custom-scheme URIs don't double-fire
    // if CustomSchemeSource is also active.
    _sub = _appLinks.uriLinkStream.where(_isHttps).listen(_router.route);
  }

  void dispose() => _sub?.cancel();

  bool _isHttps(Uri uri) => uri.scheme == 'https' || uri.scheme == 'http';
}
