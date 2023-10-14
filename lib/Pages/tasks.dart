import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_drawer.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Appdraw(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Tasks: ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.acme.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
