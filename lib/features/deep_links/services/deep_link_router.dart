import 'package:flutter_daily_practice/features/deep_links/handlers/deep_link_handler.dart';
import 'package:flutter_daily_practice/features/deep_links/handlers/screen_one_handler.dart';
import 'package:flutter_daily_practice/features/deep_links/handlers/screen_two_handler.dart';

/// Owns the handler chain and exposes a single [route] entry point.
///
/// All URI sources (custom scheme, App Links, Universal Links) funnel here.
/// The chain is built once at construction — add new screens by extending it:
///
///   screenOne.setNext(screenTwo).setNext(myNewScreenHandler)
///
/// The order determines priority: first matching handler wins.
class DeepLinkRouter {
  late final DeepLinkHandler _chain;

  DeepLinkRouter() {
    final screenOne = ScreenOneHandler();
    screenOne.setNext(ScreenTwoHandler());
    // To add more routes: screenTwo.setNext(ScreenThreeHandler())
    _chain = screenOne;
  }

  /// Walk the chain until a handler claims [uri] or the chain is exhausted.
  bool route(Uri uri) => _chain.handle(uri);
}
