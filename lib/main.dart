import 'package:flutter/material.dart';
import 'package:tyr/Pages/login_page.dart';
import 'color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  var password = pref.getString('password');
  runApp(MaterialApp(
    home: email == null && password == null ? const Login() : const TYR(),
  ));
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
