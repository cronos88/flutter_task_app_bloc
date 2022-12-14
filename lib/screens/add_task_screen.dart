import 'package:flutter/material.dart';
import 'package:task_app_ajfluttertutorials/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: titleController.text,
                      description: descriptionController.text, // linea nueva
                      id: GUIDGen.generate(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
