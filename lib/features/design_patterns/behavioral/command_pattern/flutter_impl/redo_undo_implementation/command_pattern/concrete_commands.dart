import 'package:flutter_daily_practice/features/design_patterns/behavioral/command_pattern/flutter_impl/redo_undo_implementation/command_pattern/receiver.dart';

import 'command.dart';

class IncrementCommand implements Command {
  final Counter counter;

  IncrementCommand(this.counter);

  @override
  void execute() {
    counter.increment();
  }

  @override
  void undo() {
    counter.decrement();
  }
}

class DecrementCommand implements Command {
  final Counter counter;

  DecrementCommand(this.counter);

  @override
  void execute() {
    counter.decrement();
  }

  @override
  void undo() {
    counter.increment();
  }
}