import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/command_interface.dart';

class RemoteControl {
  late Command command;

  void setCommand(Command command) {
    this.command = command;
  }

  void pressButton() {
    command.execute();
  }
}