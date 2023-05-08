import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Text(
              'Welcome to TYR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }
}
