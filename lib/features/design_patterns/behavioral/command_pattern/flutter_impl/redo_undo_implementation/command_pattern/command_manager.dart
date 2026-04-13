import 'command.dart';

class CommandManager {
  final List<Command> _history = [];
  final List<Command> _redoStack = [];

  void execute(Command command) {
    command.execute();
    _history.add(command);
    _redoStack.clear();
  }

  void undo() {
    if (_history.isNotEmpty) {
      final command = _history.removeLast();
      command.undo();
      _redoStack.add(command);
    }
  }

  void redo() {
    if (_redoStack.isNotEmpty) {
      final command = _redoStack.removeLast();
      command.execute();
      _history.add(command);
    }
  }
}
