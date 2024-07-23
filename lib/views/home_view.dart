import 'package:flutter/material.dart';
import 'package:simple_todo_app/helper/show_dialog_function.dart';

import 'package:simple_todo_app/widgets/task_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const TaskCard(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogForAddTask(context, onPressed: () {});
        },
        backgroundColor: Theme.of(context).cardColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
