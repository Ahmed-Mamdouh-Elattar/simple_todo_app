import 'package:flutter/material.dart';
import 'package:simple_todo_app/views/home_view.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.yellow,
          centerTitle: true,
          elevation: 0,
        ),
        cardColor: Colors.yellow,
      ),
      home: const HomeView(),
    );
  }
}
