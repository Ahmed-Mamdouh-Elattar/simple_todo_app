import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/models/task_model.dart';

part 'get_tasks_state.dart';

List<TaskModel> tasks = [];

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  void getTasks() {
    try {
      tasks = Hive.box<TaskModel>(kBoxName).values.toList();
      emit(GetTasksSuccess(tasks: tasks));
    } catch (e) {
      emit(GetTasksFailure(errMessage: e.toString()));
    }
  }
}
