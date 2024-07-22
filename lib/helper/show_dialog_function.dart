import 'package:flutter/material.dart';
import 'package:simple_todo_app/widgets/custom_text_button.dart';
import 'package:simple_todo_app/widgets/custom_text_field.dart';

dialogForAddTask(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: const Text("Add Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              onSaved: (value) {},
              hint: "Enter title",
              maxLines: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CustomTextField(
                onSaved: (value) {},
                hint: "Enter description",
                maxLines: 5,
              ),
            ),
          ],
        ),
        actions: [
          CustomTextButton(
            onPressed: () {},
          )
        ],
      );
    },
  );
}
