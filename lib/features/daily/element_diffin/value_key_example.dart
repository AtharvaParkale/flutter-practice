import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/daily/element_diffin/text_field_item.dart';


// What this example shows
// Flutter matches widgets using stable identity (key).
// State moves with the correct item.
// Efficient and safe for lists.

// Result
// ✅ Text stays with the correct item
// ✅ State preserved correctly
// ✅ Best practice for dynamic lists


// Global Key Implementation
// The same can be achieved with global key as well
// GlobalKey gives direct access to State.
// State identity is globally unique.
// Flutter must do extra work.
// ⚠️ Works correctly
// ⚠️ Higher memory + slower rebuild
// ❌ Not meant for lists


class ValueKeyExample extends StatefulWidget {
  const ValueKeyExample({super.key});

  @override
  State<ValueKeyExample> createState() => _ValueKeyExampleState();
}

class _ValueKeyExampleState extends State<ValueKeyExample> {
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
          ElevatedButton(onPressed: reorder, child: const Text('Reorder')),
          ...items.map((id) => TextItem(key: ValueKey(id), id: id)),
        ],
      ),
    );
  }
}
