import 'package:demoapp/views/add_todo/widgets/app_bar.dart';
import 'package:demoapp/views/add_todo/widgets/todo_form.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTodoAppBar(),
      body: TodoFrom(),
    );
  }
}
