import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BannerWebView extends StatefulWidget {
  final String url;

  const BannerWebView({super.key, required this.url});

  @override
  State<BannerWebView> createState() => _BannerWebViewState();
}

class _BannerWebViewState extends State<BannerWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..enableZoom(false) // 👈 important
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 180,
          width: constraints.maxWidth, // 👈 match parent width
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: WebViewWidget(controller: controller),
        );
      },
    );
  }
}