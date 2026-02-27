import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  final int id;

  const TextItem({super.key, required this.id});

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('initState → item ${widget.id}');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate → item ${widget.id}');
  }

  @override
  void dispose() {
    controller.dispose();
    print('dispose → item ${widget.id}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Item ${widget.id}',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
