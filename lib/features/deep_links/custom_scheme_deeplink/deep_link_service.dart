import 'dart:async';

import 'package:app_links/app_links.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  void init(Function(Uri) onLinkReceived) async {
    // 🔥 Case 1: App opened via link (cold start)
    final Uri? initialUri = await _appLinks.getInitialLink();

    if (initialUri != null) {
      onLinkReceived(initialUri);
    }

    // 🔥 Case 2: App already running
    _sub = _appLinks.uriLinkStream.listen((uri) {
      onLinkReceived(uri);
    });
  }

  void dispose() {
    _sub?.cancel();
  }
}
