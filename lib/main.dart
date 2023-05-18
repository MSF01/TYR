import 'package:flutter/material.dart';
import 'package:tyr/Pages/login_page.dart';
import 'Pages/home.dart';
import 'color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
