import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyr/Pages/login_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = '';

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

  void signOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('email');
    pref.remove('rememberMe');

    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 225),
            Text('Welcome Back ' + username),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                signOut();
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
