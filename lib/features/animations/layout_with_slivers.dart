import 'package:flutter/material.dart';

class WithSliversScreen extends StatelessWidget {
  const WithSliversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('With Slivers'),
            pinned: true,
          ),

          /// Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) => Container(
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: Center(child: Text('H $index')),
                ),
              ),
            ),
          ),

          /// Vertical List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                title: Text('List Item $index'),
              ),
              childCount: 5,
            ),
          ),

          /// Grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                margin: const EdgeInsets.all(8),
                color: Colors.green,
                child: Center(child: Text('Grid $index')),
              ),
              childCount: 6,
            ),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}