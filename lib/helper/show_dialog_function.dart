import 'package:flutter/material.dart';

dialogForAddTask(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) {
      return const AddTaskForm();
    },
  );
}
