import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/models/task_model.dart';

part 'task_state.dart';

class AddTaskCubit extends Cubit<TaskState> {
  AddTaskCubit() : super(TaskInitial());
  List<TaskModel> tasks = [];
  void addTask(TaskModel task) {
    emit(TaskLoading());
    try {
      Hive.box<TaskModel>(kBoxName).add(task);
      emit(TaskSuccess());
    } catch (e) {
      emit(TaskFailure(errMessage: e.toString()));
    }
  }

  getTasks() {
    emit(TaskLoading());
    try {
      tasks = Hive.box<TaskModel>(kBoxName).values.toList();
      emit(TaskSuccess());
    } catch (e) {
      emit(TaskFailure(errMessage: e.toString()));
    }
  }
}
