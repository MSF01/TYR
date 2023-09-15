import 'package:flutter/material.dart';
import 'package:tyr/components/textfield.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final createTask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a new task')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              'Title',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: TheTextField(
              controller: createTask,
              hint: 'Enter new plan',
              size: 18,
              icon: Icon(Icons.calendar_month_outlined),
            ),
          )
        ],
      ),
    );
  }
}
