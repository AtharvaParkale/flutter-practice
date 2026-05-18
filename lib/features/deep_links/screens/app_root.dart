import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/deep_links/custom_scheme_deeplink/custom_scheme_source.dart';
import 'package:flutter_daily_practice/features/deep_links/services/deep_link_router.dart';

/// Root widget that wires the deep-link infrastructure to the Flutter app.
///
/// Responsibilities:
///   1. Create [DeepLinkRouter] — owns the Chain of Responsibility.
///   2. Create [CustomSchemeSource] — the single low-level URI listener.
///   3. Apply the cold-start guard to prevent duplicate navigation.
///
/// Why the guard lives here and not in the router:
///   The guard is stateful (widget lifecycle), so it belongs in the widget layer.
///   The router stays stateless and reusable.
class AppRoot extends StatefulWidget {
  final Widget child;

  const AppRoot({required this.child, super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final CustomSchemeSource _source;

  // Prevents duplicate navigation when the app_links package fires both
  // getInitialLink() AND uriLinkStream for the same cold-start URI.
  bool _handledInitialLink = false;

  @override
  void initState() {
    super.initState();

    final router = DeepLinkRouter();

    _source = CustomSchemeSource(
      router: router,
      onInitialLink: (uri) {
        if (_handledInitialLink) return; // guard — drop the duplicate
        _handledInitialLink = true;
        // addPostFrameCallback ensures the navigator is fully mounted
        // before we push a new route onto it.
        WidgetsBinding.instance.addPostFrameCallback((_) => router.route(uri));
      },
    );

    // Also defer init so the navigator key is ready before the first push.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _source.init();
    });
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
