import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_drawer.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final tasks = FirebaseFirestore.instance.collection('Tasks');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Appdraw(),
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Your Tasks: ',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.acme.toString(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Tasks').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final tasks = snapshot.data!.docs;

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index].data() as Map<String, dynamic>;

                  return ListTile(
                    title: Text('Test'),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
