import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_daily_practice/features/deep_links/services/deep_link_router.dart';

/// Listens for ALL incoming URIs via the [AppLinks] package and routes them.
///
/// The [app_links] package is the single low-level listener for every link type:
///   • Custom scheme  (myapp://...)          — works on both Android & iOS
///   • App Links      (https://... Android)  — needs autoVerify intent-filter
///   • Universal Links (https://... iOS)     — needs Associated Domains entitlement
///
/// Two delivery scenarios are handled:
///   1. Cold start  — app launched by tapping a link → [getInitialLink]
///   2. Warm start  — app already running            → [uriLinkStream]
///
/// The cold-start URI is passed to [onInitialLink] so the caller (AppRoot)
/// can apply its duplicate-navigation guard before routing.
/// Warm-start URIs go directly to [router.route].
class CustomSchemeSource {
  final AppLinks _appLinks = AppLinks();
  final DeepLinkRouter _router;
  final void Function(Uri) _onInitialLink;
  StreamSubscription<Uri>? _sub;

  CustomSchemeSource({
    required DeepLinkRouter router,
    required void Function(Uri) onInitialLink,
  })  : _router = router,
        _onInitialLink = onInitialLink;

  Future<void> init() async {
    // Cold start: app was launched by tapping a link.
    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _onInitialLink(initialUri); // AppRoot applies the _handledInitialLink guard
    }

    // Warm start: subsequent links while the app is running.
    _sub = _appLinks.uriLinkStream.listen(_router.route);
  }

  void dispose() => _sub?.cancel();
}
