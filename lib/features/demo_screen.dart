import 'package:flutter/material.dart';

import 'banner_webview.dart';

class HomePage extends StatelessWidget {
  final List<String> bannerUrls = [
    "https://ipl-banner-impl.vercel.app/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),

      body: ListView(
        children: [
          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "🔥 Live Banners",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 8),

          // 👇 Multiple banners
          ...bannerUrls.map((url) => BannerWebView(url: url)).toList(),

          const SizedBox(height: 20),

          // 👇 Normal Flutter UI below
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Other Flutter Content"),
          ),
        ],
      ),
    );
  }
}
