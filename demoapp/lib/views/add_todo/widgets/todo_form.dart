import 'package:demoapp/models/manage_todo.dart';
import 'package:demoapp/models/todo_model.dart';
import 'package:demoapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoFrom extends StatefulWidget {
  const TodoFrom({super.key});

  @override
  State<TodoFrom> createState() => _TodoFromState();
}

class _TodoFromState extends State<TodoFrom> {
  PriorityEnum value = PriorityEnum.LOW;
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heigth = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: heigth * 0.6,
        width: width * 0.3,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Form :",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: heigth * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heigth * 0.05,
                  width: width * 0.2,
                  child: TextField(
                    decoration: InputDecoration(label: Text("Titre")),
                    controller: titleControler,
                  ),
                ),
                SizedBox(
                  height: heigth * 0.02,
                ),
                SizedBox(
                  height: heigth * 0.05,
                  width: width * 0.2,
                  child: TextField(
                    decoration: InputDecoration(label: Text("Descritpion")),
                    controller: descriptionControler,
                  ),
                ),
                SizedBox(
                  height: heigth * 0.02,
                ),
                DropdownButton<PriorityEnum>(
                  items: PriorityEnum.values.map((PriorityEnum priority) {
                    return DropdownMenuItem<PriorityEnum>(
                      value: priority,
                      child: Text(priority.name),
                    );
                  }).toList(),
                  value: value,
                  onChanged: (PriorityEnum? newPriority) {
                    setState(() {
                      value = newPriority!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: heigth * 0.2,
            ),
            FilledButton(
              onPressed: () {
                context.read<ManageTodo>().addItem(
                      TodoItem(
                          title: titleControler.text,
                          description: descriptionControler.text,
                          priority: value,
                          isCompleted: false),
                    );
                Navigator.pop(context);
              },
              child: Text("Ajouter"),
            )
          ],
        ),
      ),
    );
  }
}
