import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tyr/components/character_limit_textfield.dart';
import 'package:tyr/components/textfield.dart';

import 'package:tyr/components/gradient_button.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final DateTime _dateTime = DateTime.now();
  String formateDateTime = '';

  TimeOfDay _timeOfDayNow = TimeOfDay.now();
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  void timePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _timeOfDayNow,
    );
    if (time != null) {
      setState(() {
        _timeOfDayNow = time;
        selectedTime = time;
        pickTime.text = _timeOfDayNow.format(context);
      });
    }
  }

  void datePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1940),
      lastDate: DateTime(_dateTime.year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        formateDateTime = DateFormat('dd-MM-yyyy').format(_dateTime);
        selectedDate = pickedDate;
        pickDate.text = formateDateTime;
      });
    }
  }

  void startTimer() {
    final now = DateTime.now();
    final taskDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    final duration = taskDateTime.difference(now);
    Timer(duration, () {
      print('The reminder is ringing');
    });
  }

  late final String? countText;
  final createTask = TextEditingController();
  final createDescription = TextEditingController();
  final pickDate = TextEditingController();
  final pickTime = TextEditingController();

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
                'Title *',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TheTextField(
              readOnly: false,
              controller: createTask,
              hint: 'Enter new plan',
              size: 18,
              preIcon: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Date & Time *',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 215,
              child: TheTextField(
                controller: pickDate,
                hint: '01-01-2000',
                size: 18,
                sufIcon: const Icon(Icons.calendar_month_outlined),
                readOnly: true,
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
                hint: '12:00',
                size: 18,
                readOnly: true,
                sufIcon: const Icon(Icons.timer_outlined),
                onTap: () {
                  timePicker();
                  print('Time Picker Working');
                },
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Description *',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 15),
            CharacterLimitTextField(
              controller: createDescription,
              hint: 'Enter Description Here...',
              lines: 5,
            ),
            const SizedBox(height: 25),
            Center(
              child: GradientButton(
                onPressed: () {},
                text: 'Create',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
