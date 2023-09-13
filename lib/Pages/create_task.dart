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
        children: [
          const SizedBox(height: 10),
          SizedBox(height: 50, width: 400, child: TextIP)
        ],
      ),
    );
  }
}
