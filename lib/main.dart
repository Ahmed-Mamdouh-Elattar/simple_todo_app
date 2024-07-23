import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_todo_app/constants.dart';
import 'package:simple_todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:simple_todo_app/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:simple_todo_app/models/task_model.dart';
import 'package:simple_todo_app/simple_bloc_observer.dart';
import 'package:simple_todo_app/views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kBoxName);

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTaskCubit(),
        ),
        BlocProvider(
          create: (context) => GetTasksCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.yellow,
            centerTitle: true,
            elevation: 0,
          ),
          cardColor: Colors.yellow,
        ),
        home: const HomeView(),
      ),
    );
  }
}
