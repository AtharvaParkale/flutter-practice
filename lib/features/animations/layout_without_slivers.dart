import 'package:flutter/material.dart';

class WithoutSliversScreen extends StatelessWidget {
  const WithoutSliversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Without Slivers')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Horizontal List
            SizedBox(
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

            /// Vertical List
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) =>
                    ListTile(title: Text('List Item $index')),
              ),
            ),

            /// Grid
            GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.all(8),
                color: Colors.green,
                child: Center(child: Text('Grid $index')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
