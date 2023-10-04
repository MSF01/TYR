import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

import 'package:tyr/components/character_limit_textfield.dart';
import 'package:tyr/components/local_notification.dart';
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

  late final String? countText;
  final createTask = TextEditingController();
  final createDescription = TextEditingController();
  final pickDate = TextEditingController();
  final pickTime = TextEditingController();
  String error = '';
  Color containerColor1 = const Color(0xFF1A1A1A);
  Color containerColor2 = const Color(0xFF1A1A1A);
  Color containerColor3 = const Color(0xFF1A1A1A);
  Color originalColor = const Color(0xFF1A1A1A);

  bool isTapped = false;
  int selectedContainer = 0;

  void timePicker(BuildContext context) async {
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

  void datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(_dateTime.year),
      lastDate: DateTime(_dateTime.year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        formateDateTime = DateFormat('dd-MM-yyyy').format(_dateTime);
        selectedDate = pickedDate;
        pickDate.text = formateDateTime;
      });
    }

    timePicker(context);
  }

  void startTimer(DateTime selectedDate, TimeOfDay selectedTime) {
    final now = DateTime.now();
    final taskDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final duration = taskDateTime.difference(now);
    Timer(duration, () {
      LocalNotification().showNotification(
        title: 'Task Reminder',
        body: 'Your task is ringing',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a new task')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
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
                lines: 1,
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
                    datePicker(context);
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 215,
                child: TheTextField(
                  controller: pickTime,
                  hint: '12:00 AM',
                  size: 18,
                  readOnly: true,
                  sufIcon: const Icon(Icons.timer_outlined),
                  onTap: () {
                    timePicker(context);
                  },
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
              CharacterLimitTextField(
                controller: createDescription,
                hint: 'Enter Description Here...',
                lines: 5,
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Select your category',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedContainer = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectedContainer == 1
                                ? Colors.grey.shade800
                                : containerColor1,
                          ),
                          height: 70,
                          width: 70,
                          child: const Center(
                            child: Text(
                              '💼',
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedContainer = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectedContainer == 2
                                ? Colors.grey.shade800
                                : containerColor2,
                          ),
                          height: 70,
                          width: 70,
                          child: const Center(
                            child: Text(
                              '🏖️',
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedContainer = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectedContainer == 3
                                ? Colors.grey.shade800
                                : containerColor3,
                          ),
                          height: 70,
                          width: 70,
                          child: const Center(
                            child: Text(
                              '🎊',
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: GradientButton(
                  onPressed: () async {
                    if (createTask.text == '') {
                      setState(() {
                        error = 'The title cannot be left empty';
                      });
                      return;
                    }

                    LocalNotification().showNotification(
                      title: 'Task Created',
                      body: 'Your task has been created for you',
                    );
                    startTimer(selectedDate!, selectedTime!);
                  },
                  text: 'Create',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  error,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
