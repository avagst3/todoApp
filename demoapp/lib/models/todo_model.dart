import 'package:demoapp/utils/constant.dart';

class TodoItem {
  final String title;
  final String description;
  final PriorityEnum priority;
  bool isCompleted;

  TodoItem({
    required this.title,
    required this.description,
    required this.priority,
    required this.isCompleted,
  });

  void done() {
    isCompleted = !isCompleted;
  }
}
