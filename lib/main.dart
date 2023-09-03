import 'package:flutter/material.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/login_page.dart';
import 'package:tyr/splash.dart';
import 'color.dart';
import 'package:firebase_core/firebase_core.dart';
import '.firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TYR());
}

class TYR extends StatelessWidget {
  const TYR({super.key});

  static String homeRoute = "/home";
  static String loginRoute = "/login";
  static String onBoard = "/splash";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primarycolor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: onBoard,
      routes: {
        "/": (context) => const Login(),
        homeRoute: (context) => const Home(),
        loginRoute: (context) => const Login(),
        onBoard: (context) => const Splash()
      },
    );
  }
}
