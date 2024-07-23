part of 'task_cubit.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {}

final class TaskFailure extends TaskState {
  final String errMessage;
  TaskFailure({required this.errMessage});
}
