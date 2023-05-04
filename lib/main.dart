import 'package:flutter/material.dart';
import 'package:tyr/Pages/login_page.dart';
import 'Pages/home.dart';
import 'color.dart';

void main() {
  runApp(const TYR());
}

class TYR extends StatelessWidget {
  const TYR({super.key});

  static String loginRoute = "/login";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primarycolor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/": (context) => const Login(),
        // "/home": (context) => const Home(),
        loginRoute: (context) => const Login()
      },
    );
  }
}
