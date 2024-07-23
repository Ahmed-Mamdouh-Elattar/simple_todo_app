import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:simple_todo_app/cubits/get_tasks_cubit/get_tasks_cubit.dart';

import 'package:simple_todo_app/models/task_model.dart';

import 'package:simple_todo_app/widgets/custom_text_button.dart';
import 'package:simple_todo_app/widgets/custom_text_field.dart';

dialogForAddTask(
  BuildContext context,
) {
  late String title;
  late String description;
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: AlertDialog(
          scrollable: true,
          title: const Text("Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                validator: (value) {
                  return value == null || value == ''
                      ? "Title is required"
                      : null;
                },
                onSaved: (value) {
                  title = value!;
                },
                hint: "Enter title",
                maxLines: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: CustomTextField(
                  validator: (value) {
                    return value == null || value == ''
                        ? "Description is required"
                        : null;
                  },
                  onSaved: (value) {
                    description = value!;
                  },
                  hint: "Enter description",
                  maxLines: 5,
                ),
              ),
            ],
          ),
          actions: [
            CustomTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState?.save();
                  BlocProvider.of<AddTaskCubit>(context).addTask(TaskModel(
                      description: description, title: title, isDone: false));
                  BlocProvider.of<GetTasksCubit>(context).getTasks();
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      );
    },
  );
}
