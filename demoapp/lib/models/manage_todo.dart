import 'package:demoapp/models/todo_model.dart';
import 'package:flutter/material.dart';

class ManageTodo extends ChangeNotifier {
  final List<TodoItem> _list = [];

  List<TodoItem> get list => _list;

  void addItem(TodoItem todoItem) {
    list.add(todoItem);
    notifyListeners();
  }

  void removeItem(TodoItem todoItem) {
    list.remove(todoItem);
    notifyListeners();
  }

  void updateStatus(int index) {
    list[index].done();
    notifyListeners();
  }
}
