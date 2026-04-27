import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/deep_links/screens/screen_one.dart';
import 'package:flutter_daily_practice/main.dart';

class DeepLinkUtils {
  void handleDeepLink(Uri uri) {
    print('Demo 1 (Host) :: ${uri.host}');
    print('Demo 2 (Scheme) :: ${uri.scheme}');
    if (uri.scheme == 'myapp' && uri.host == 'screenone') {
      final id = uri.queryParameters['id'];
      print('Demo 3 (Navigation) :: ');
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => ScreenOne(id: id ?? "Null")),
      );
    }
  }
}
