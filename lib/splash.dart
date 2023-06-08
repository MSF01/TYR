import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    FirebaseAuth.instance.signOut();
    super.initState();
    Login().checkUser().then(
      (available) {
        if (available) {
          navigateToScreen(const Home());
        } else {
          navigateToScreen(const Login());
        }
      },
    );
  }

  void navigateToScreen(Widget next) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => next),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
