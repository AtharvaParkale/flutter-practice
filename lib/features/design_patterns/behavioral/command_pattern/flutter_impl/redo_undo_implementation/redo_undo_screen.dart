import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/redo_undo_implementation/command_pattern/command_manager.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/redo_undo_implementation/command_pattern/concrete_commands.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/redo_undo_implementation/command_pattern/receiver.dart';

class RedoUndoScreen extends StatelessWidget {
  RedoUndoScreen({super.key});

  final manager = CommandManager();
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                manager.execute(IncrementCommand(counter));
              },
              child: Text("Increment"),
            ),
            ElevatedButton(onPressed: manager.undo, child: Text("Undo")),
            ElevatedButton(onPressed: manager.redo, child: Text("Redo")),
          ],
        ),
      ),
    );
  }
}
