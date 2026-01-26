import 'package:flutter/material.dart';

class SliversScreen extends StatefulWidget {
  const SliversScreen({super.key});

  @override
  State<SliversScreen> createState() => _SliversScreenState();
}

class _SliversScreenState extends State<SliversScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Home'), pinned: true),

          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(16), child: Text('Featured')),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(child: Text('Grid $index')),
              childCount: 6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
