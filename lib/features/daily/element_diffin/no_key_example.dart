import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/daily/element_diffin/text_field_item.dart';


// Example 1 — WITHOUT KEYS ❌

// ❌ Buggy behavior when reordering
// What this example shows
// Flutter matches widgets by position (index).
// When list order changes, State is reused incorrectly.
// Text typed in one TextField moves to another item.

// 1. Add text inside each textfield, when reorder is pressed the
// 2. Text inside text field remain at same place

// item 1 -> text 1
// item 2 -> text 2

// Reorder

// This is not the expected behaviour
// item 2 -> text 1
// item 1 -> text 2

// Expected behaviour is  (Can be achieved with keys)
// item 2 -> text 2
// item 1 -> text 1

// Result
// ❌ TextField state is attached to position, not item
// ❌ Wrong data shown after reorder

class NoKeyExample extends StatefulWidget {
  const NoKeyExample({super.key});

  @override
  State<NoKeyExample> createState() => _NoKeyExampleState();
}

class _NoKeyExampleState extends State<NoKeyExample> {
  List<int> items = [1, 2, 3];

  void reorder() {
    setState(() {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: reorder,
            child: const Text('Reorder'),
          ),
          ...items.map((id) => TextItem(id: id)),
        ],
      ),
    );
  }
}
