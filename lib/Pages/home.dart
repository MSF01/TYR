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

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
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
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: ListView(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text(username), accountEmail: Text('lol')),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: GoogleFonts.alata().fontFamily,
                  ),
                ),
                onTap: () {},
              )
            ],
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
              'Hey! Mate',
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
          ElevatedButton(
            onPressed: () async {
              signOut();
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
