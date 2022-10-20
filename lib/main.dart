import 'package:flutter/material.dart';

import 'screens/task_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskScreen(),
    );
  }
}
