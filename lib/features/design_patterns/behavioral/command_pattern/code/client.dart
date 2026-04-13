import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/concrete_commands.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/invoker.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/receiver.dart';

void main() {
  // Here light has two functionalities
  final light = Light();

  // We attach on command (When we need to turn on the light)
  final onCommand = LightOnCommand(light);

  // We attach off command (When we need to turn off the light)
  final offCommand = LightOffCommand(light);

  final remote = RemoteControl();

  remote.setCommand(onCommand);
  remote.pressButton();

  remote.setCommand(offCommand);
  remote.pressButton();
}
