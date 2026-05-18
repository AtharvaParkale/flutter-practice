import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/deep_links/handlers/deep_link_handler.dart';
import 'package:flutter_daily_practice/features/deep_links/screens/screen_two.dart';
import 'package:flutter_daily_practice/main.dart';

/// Handles deep links that point to ScreenTwo.
///
/// Matches BOTH link types for the same destination:
///   • Custom scheme  →  myapp://screentwo?id=7
///   • App Link/ULink →  https://yourdomain.com/screentwo?id=7
///
/// ScreenTwo expects an integer id; defaults to 0 if missing or non-numeric.
class ScreenTwoHandler extends DeepLinkHandler {
  static const _customScheme = 'myapp';
  static const _httpsHost = 'yourdomain.com';
  static const _segment = 'screentwo';

  @override
  bool handle(Uri uri) {
    if (_matches(uri)) {
      final id = int.tryParse(uri.queryParameters['id'] ?? '') ?? 0;
      debugPrint('[DeepLink] ScreenTwoHandler matched → id=$id');
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => ScreenTwo(id: id)),
      );
      return true; // consumed — stop the chain
    }
    return super.handle(uri); // not mine — pass to next handler
  }

  bool _matches(Uri uri) {
    // myapp://screentwo
    final isCustomScheme =
        uri.scheme == _customScheme && uri.host == _segment;

    // https://yourdomain.com/screentwo
    final isHttps = uri.scheme == 'https' &&
        uri.host == _httpsHost &&
        uri.pathSegments.firstOrNull == _segment;

    return isCustomScheme || isHttps;
  }
}
