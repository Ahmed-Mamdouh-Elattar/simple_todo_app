part of 'add_task_cubit.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskSuccess extends TaskState {}

final class TaskFailure extends TaskState {
  final String errMessage;
  TaskFailure({required this.errMessage});
}
