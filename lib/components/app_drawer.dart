import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:ui';
import 'package:tyr/Pages/profile.dart';

import '../Pages/home.dart';
import '../Pages/login_page.dart';

class Appdraw extends StatefulWidget {
  const Appdraw({super.key});

  @override
  State<Appdraw> createState() => _AppdrawState();
}

class _AppdrawState extends State<Appdraw> {
  @override
  void initState() {
    super.initState();
    getUsername();
    getEmail();
  }

  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }

  Future<void> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    void signOut() async {
      final pref = await SharedPreferences.getInstance();
      pref.remove('email');
      pref.remove('rememberMe');

      FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }

    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          backgroundColor: Colors.white.withOpacity(0.7),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: ListView(
              padding: const EdgeInsets.all(5),
              children: <Widget>[
                const SizedBox(height: 70),
                SizedBox(
                  height: 35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome: $username',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: GoogleFonts.alata().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.alata().fontFamily,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const Home())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_2_outlined),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.alata().fontFamily,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const CurrentUser())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.alata().fontFamily,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  // thickness: 1.5,
                  color: Colors.black54,
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.alata().fontFamily,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app_outlined),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.alata().fontFamily,
                    ),
                  ),
                  onTap: () async {
                    signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
