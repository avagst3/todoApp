import 'package:demoapp/models/manage_todo.dart';
import 'package:demoapp/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageTodo>(builder: (context, item, child) {
      return item.list.isNotEmpty
          ? ListView.builder(
              itemCount: item.list.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Checkbox(
                    checkColor: Colors.green,
                    value: item.list[index].isCompleted,
                    onChanged: (_) =>
                        {context.read<ManageTodo>().updateStatus(index)},
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.list[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          decoration: item.list[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.list[index].description,
                        style: TextStyle(
                          fontSize: 15,
                          decoration: item.list[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ManageTodo>().removeItem(item.list[index]);
                    },
                  ),
                  tileColor: item.list[index].isCompleted
                      ? Colors.grey
                      : switch (item.list[index].priority) {
                          PriorityEnum.LOW => Colors.greenAccent,
                          PriorityEnum.MEDIUM => Colors.orangeAccent,
                          PriorityEnum.HIGHT => Colors.redAccent
                        },
                );
              },
            )
          : const Center(
              child: Text("Aucun todo"),
            );
    });
  }
}
