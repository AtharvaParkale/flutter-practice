import 'package:flutter/material.dart';
import 'package:flutter_daily_practice/features/home/presentation/ui/screens/ticker_screen.dart';

import 'command_interface.dart';

class NavigateToProfileCommand implements Command {
  final BuildContext context;

  NavigateToProfileCommand(this.context);

  @override
  void execute() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
  }
}
