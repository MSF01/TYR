import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tyr/components/textfield.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime _dateTime = DateTime.now();
  String formateDateTime = '';

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        formateDateTime = DateFormat('dd-MM-yyyy').format(_dateTime);
        pickDate.text = formateDateTime;
      });
    });
  }

  final createTask = TextEditingController();
  final createDescription = TextEditingController();
  final pickDate = TextEditingController();
  final pickTime = TextEditingController(text: 'Value');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a new task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TheTextField(
              controller: createTask,
              hint: 'Enter new plan',
              size: 18,
              preIcon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Date & Time',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 215,
              child: TheTextField(
                controller: pickDate,
                hint: '',
                size: 18,
                sufIcon: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  datePicker();
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 215,
              child: TheTextField(
                controller: pickTime,
                hint: '',
                size: 18,
                sufIcon: const Icon(Icons.timer_outlined),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            TheTextField(
              controller: createDescription,
              hint: 'Enter Description Here...',
              size: 18,
              lines: 5,
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {
                  print('Button is working');
                },
                child: const Text(
                  'Create',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
