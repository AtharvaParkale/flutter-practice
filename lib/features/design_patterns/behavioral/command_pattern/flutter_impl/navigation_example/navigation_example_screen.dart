import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/navigation_example/command_pattern/command_interface.dart';

import 'command_pattern/concrete_command.dart';

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Command command = NavigateToProfileCommand(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            command.execute();
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
