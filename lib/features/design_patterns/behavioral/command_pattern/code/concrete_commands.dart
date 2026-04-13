import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/receiver.dart';

import 'command_interface.dart';

class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }
}

class LightOffCommand implements Command {
  final Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.turnOff();
  }
}