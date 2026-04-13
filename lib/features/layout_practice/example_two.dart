// Build UI that is different for mac and for phone

import 'package:flutter/material.dart';

// This is a good way to create UI for different sizes
class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    if (width > 700) {
      return Scaffold(
        body: Center(
          child: Row(
            children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
          ),
        ),
      );
    }
  }
}

// Create UI using layout builder

class LayOutBuilderExample extends StatelessWidget {
  const LayOutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 700) {
        return Text("1");
      }
      else {
        return Text("2");
      }
    }
    );
  }
}
