import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo_app/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:simple_todo_app/helper/show_dialog_function.dart';

import 'package:simple_todo_app/widgets/task_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTasksCubit>(context).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<GetTasksCubit, GetTasksState>(
        builder: (context, state) {
          return state is GetTasksSuccess
              ? ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: state.tasks[index],
                    );
                  },
                )
              : state is GetTasksFailure
                  ? Text(state.errMessage)
                  : const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogForAddTask(context);
        },
        backgroundColor: Theme.of(context).cardColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
