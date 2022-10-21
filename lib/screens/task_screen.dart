import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  List<Task> taskList = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text('Tasks:'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                final task = taskList[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
