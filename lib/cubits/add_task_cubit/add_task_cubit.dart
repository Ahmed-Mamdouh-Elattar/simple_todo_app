import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<TaskState> {
  AddTaskCubit() : super(TaskInitial());

  void addTask(TaskModel task) {
    try {
      Hive.box<TaskModel>(kBoxName).add(task);
      emit(TaskSuccess());
    } catch (e) {
      emit(TaskFailure(errMessage: e.toString()));
    }
  }
}
