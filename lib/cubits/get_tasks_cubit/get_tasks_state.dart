part of 'get_tasks_cubit.dart';

sealed class GetTasksState {}

final class GetTasksInitial extends GetTasksState {}

final class GetTasksLoading extends GetTasksState {}

final class GetTasksSuccess extends GetTasksState {
  List<TaskModel> tasks;
  GetTasksSuccess({required this.tasks});
}

final class GetTasksFailure extends GetTasksState {
  final String errMessage;
  GetTasksFailure({required this.errMessage});
}
