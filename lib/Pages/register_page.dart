import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/components/textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final username = TextEditingController();
  final Email = TextEditingController();
  final Password = TextEditingController();
  final ConfirmPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                'Register Now',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              const SizedBox(height: 50),
              TheTextField(
                controller: username,
                hint: 'Username',
                obsecure: false,
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: Email,
                hint: 'Email',
                obsecure: false,
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: Password,
                hint: 'Password',
                obsecure: true,
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: ConfirmPwd,
                hint: 'Confirm Password',
                obsecure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
