import 'package:demoapp/app.dart';
import 'package:demoapp/models/manage_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ManageTodo(),
    child: const App(),
  ));
}
