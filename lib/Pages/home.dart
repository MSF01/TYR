import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/Pages/create_task.dart';
import 'package:tyr/components/gradient_button.dart';
import 'package:tyr/components/app_drawer.dart';
import 'package:tyr/components/card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String username = '';
String email = '';

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Appdraw(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Track Your Routine'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                'Hey! $username',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.acme.toString(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(9.0),
              child: Text('Your Feed:', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  TheCard(
                    onTap: () {
                      print('Card 1 has been clicked');
                    },
                    imageLink:
                        'https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                    description:
                        'Boost productivity with TYR: The ultimate app to track your routine. Achieve goals effortlessly and stay organized. This card is for meeting category',
                  ),
                  TheCard(
                    onTap: () {
                      print('Card 2 has been clicked');
                    },
                    imageLink:
                        'https://images.unsplash.com/photo-1594179594534-9d826c107c10?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                    description:
                        'This is a description of something probably idk. This card is for vacation category',
                  ),
                  TheCard(
                    onTap: () {
                      print('Card 3 has been clicked');
                    },
                    imageLink:
                        'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                    description:
                        'This is a description also. This card is for party category',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(9.0),
              child: Text('Create a new task', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 8),
            Center(
              child: GradientButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const CreateTask()),
                    ),
                  );
                  print('Button pressed to create task');
                },
                text: 'Click me to Create',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
