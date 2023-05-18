import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void signIn() async {
    // await FirebaseAuth _firebase = FirebaseAuth.instance;
  }

  final user = TextEditingController();
  final pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Icon(
                Icons.app_registration_outlined,
                size: 100,
                color: Colors.grey.shade900,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to TYR',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 28,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TheTextField(
                  controller: user,
                  hint: 'Username',
                  obsecure: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TheTextField(
                  controller: pwd,
                  hint: 'Password',
                  obsecure: true,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: signIn,
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[500]),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 20,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' Register Now',
                    style: TextStyle(
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 20,
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
