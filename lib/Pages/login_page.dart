import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/Pages/register_page.dart';
import 'package:tyr/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      print('User logged in success with!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(
          () {
            warning = 'User is not founded';
          },
        );
      } else if (e.code == 'wrong-password') {
        setState(
          () {
            warning = 'Password you used is wrong!';
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  final email = TextEditingController();
  final password = TextEditingController();

  String warning = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Icon(
                Icons.person,
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
                  controller: email,
                  hint: 'Username',
                  obsecure: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TheTextField(
                  controller: password,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                warning,
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 20,
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      ' Register Now',
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 20,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w600,
                      ),
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
