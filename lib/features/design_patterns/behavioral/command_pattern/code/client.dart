import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/concrete_commands.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/invoker.dart';
import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/code/receiver.dart';

void main() {
  final light = Light();

  final onCommand = LightOnCommand(light);
  final offCommand = LightOffCommand(light);

  final remote = RemoteControl();

  remote.setCommand(onCommand);
  remote.pressButton();

  remote.setCommand(offCommand);
  remote.pressButton();
}
