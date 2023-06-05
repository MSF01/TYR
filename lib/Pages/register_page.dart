import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/Pages/login_page.dart';
import 'package:tyr/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> userSetup(String displayName) async {
   //firebase auth instance to get uuid of user

   //now below I am getting an instance of firebaseiestore then getting the user collection
   //now I am creating the document if not already exist and setting the data.
   FirebaseFirestore.instance.collection('Users').document(auth.uid).setData(
   {
    'displayName': displayName, 'uid': uid
   })

   return;
}

  void signUp() async {
    if (password.text != confirmPwd.text) {
      setState(() {
        warning = 'Re-check your password';
      });
    } else {
      
      try {
          AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        await saveUser(auth.user.id, username)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(
            () {
              warning = 'Weak Password';
            },
          );
        }
      }
    }
  }

  final username = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final confirmPwd = TextEditingController();

  String warning = '';

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
                fillColor: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: email,
                hint: 'Email',
                obsecure: false,
                fillColor: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: password,
                hint: 'Password',
                obsecure: true,
                fillColor: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 20),
              TheTextField(
                controller: confirmPwd,
                hint: 'Confirm Password',
                obsecure: true,
                fillColor: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 25),
              Text(
                warning,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                child: TextButton(
                  onPressed: () {
                    signUp();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: Text(
                    'Register!',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
