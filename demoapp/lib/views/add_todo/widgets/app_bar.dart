import 'package:flutter/material.dart';

class MyTodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Image(image: AssetImage("assets/logo.png")),
      leadingWidth: 200,
      title: Text(
        "Add todo",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => showDialog<String>(
              // au click du bouton on affiche une pop up
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                title: Text("Info"),
                content: SizedBox(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Version : 1.0.0"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Auteur : SAFT tuto"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Date de publication : 23/07/2024")
                    ],
                  ),
                ),
              ),
            ),
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
