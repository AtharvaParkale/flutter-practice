import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/deep_links/custom_scheme_deeplink/deep_link_service.dart';
import 'package:flutter_daily_practice/features/deep_links/utils/deep_link_utils.dart';

class AppRoot extends StatefulWidget {
  final Widget child;

  const AppRoot({required this.child, super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late DeepLinkService _deepLinkService;
  bool _handledInitialLink = false; // 👈 prevents duplicate navigation

  @override
  void initState() {
    super.initState();

    _deepLinkService = DeepLinkService();

    _deepLinkService.init((uri) {
      if (_handledInitialLink) return;
      _handledInitialLink = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        DeepLinkUtils().handleDeepLink(uri);
      });
    });
  }

  @override
  void dispose() {
    _deepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
