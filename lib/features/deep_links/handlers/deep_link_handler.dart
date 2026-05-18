import 'package:flutter/material.dart';

/// Abstract base for the Chain of Responsibility pattern.
///
/// Each concrete handler is responsible for ONE route/screen.
/// If it cannot handle the URI it passes it to the next handler in the chain.
///
/// Usage:
///   final a = ScreenOneHandler();
///   a.setNext(ScreenTwoHandler()); // fluent: a.setNext(b).setNext(c)
abstract class DeepLinkHandler {
  DeepLinkHandler? _nextHandler;

  /// Attach the next handler and return it so calls can be chained:
  ///   screenOne.setNext(screenTwo).setNext(fallback)
  DeepLinkHandler setNext(DeepLinkHandler handler) {
    _nextHandler = handler;
    return handler;
  }

  /// Try to handle [uri]. Return true if consumed, false to keep passing.
  /// Concrete handlers should call super.handle(uri) when they do NOT match
  /// so the URI travels down the chain automatically.
  bool handle(Uri uri) {
    if (_nextHandler != null) return _nextHandler!.handle(uri);
    // End of chain — nobody matched.
    debugPrint('[DeepLink] No handler matched: $uri');
    return false;
  }
}
