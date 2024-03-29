import 'package:flutter/material.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/login_page.dart';
import 'package:tyr/components/local_notification.dart';
import 'package:tyr/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotification().initNotification();

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
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.black),
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
