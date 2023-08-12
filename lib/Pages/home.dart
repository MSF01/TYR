import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyr/Pages/login_page.dart';
import 'package:tyr/components/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = '';
  String email = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          backgroundColor: Colors.white.withOpacity(0.7),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
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
                    onTap: () {},
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
                      setState(() {});
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
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Track Your Routine'),
        centerTitle: true,
        // leading: Icon(Icons.menu),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text(
              'Hey! $username',
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.acme.toString(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(right: 260.0),
            child: Text('Your Feed', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                TheCard(
                  onTap: () {},
                  title: 'Card 1',
                  description: 'This is a description',
                ),
                TheCard(
                  onTap: () {},
                  title: 'Card 2',
                  description: 'This is a description',
                ),
                TheCard(
                  onTap: () {},
                  title: 'Card 3',
                  description: 'This is a description',
                ),
                TheCard(
                  onTap: () {},
                  title: 'Card 4',
                  description: 'This is a description',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
