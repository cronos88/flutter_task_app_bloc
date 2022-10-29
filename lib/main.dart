import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';
import 'screens/task_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Task App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TaskScreen(),
      ),
    );
  }
}

// https://www.youtube.com/watch?v=PD0eAXLd5ls&list=PL4KQIoSGkL6uHbPnb1-bcWE07KT9aohQ-&index=9
// QUEDAMOS EN MINUTO 34:35