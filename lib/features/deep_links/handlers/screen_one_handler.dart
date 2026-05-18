import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/deep_links/handlers/deep_link_handler.dart';
import 'package:flutter_daily_practice/features/deep_links/screens/screen_one.dart';
import 'package:flutter_daily_practice/main.dart';

/// Handles deep links that point to ScreenOne.
///
/// Matches BOTH link types for the same destination:
///   • Custom scheme  →  myapp://screenone?id=42
///   • App Link/ULink →  https://yourdomain.com/screenone?id=42
///
/// If neither matches, the URI is forwarded to the next handler in the chain.
class ScreenOneHandler extends DeepLinkHandler {
  static const _customScheme = 'myapp';
  static const _httpsHost = 'yourdomain.com';
  static const _segment = 'screenone';

  @override
  bool handle(Uri uri) {
    if (_matches(uri)) {
      final id = uri.queryParameters['id'] ?? 'Null';
      debugPrint('[DeepLink] ScreenOneHandler matched → id=$id');
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => ScreenOne(id: id)),
      );
      return true; // consumed — stop the chain
    }
    return super.handle(uri); // not mine — pass to next handler
  }

  bool _matches(Uri uri) {
    // myapp://screenone
    final isCustomScheme =
        uri.scheme == _customScheme && uri.host == _segment;

    // https://yourdomain.com/screenone
    final isHttps = uri.scheme == 'https' &&
        uri.host == _httpsHost &&
        uri.pathSegments.firstOrNull == _segment;

    return isCustomScheme || isHttps;
  }
}
