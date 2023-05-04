// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        title: const Text("Falculator"),
        backgroundColor: primarycolor,
        foregroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
