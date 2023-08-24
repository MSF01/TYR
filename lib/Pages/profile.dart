import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/login_page.dart';

import '../components/app_drawer.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({super.key});

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  @override
  void initState() {
    super.initState();
    fetchCreationTime();
  }

  String formatCreationTime = '';
  Future<void> fetchCreationTime() async {
    try {
      if (userr != null) {
        DateTime creationTime = userr!.metadata.creationTime!;
        setState(() {
          formatCreationTime = DateFormat('dd MMMM yyyy').format(creationTime);
        });
      } else {
        print('Bug spotted');
      }
    } catch (e) {
      setState(() {
        formatCreationTime = 'Error fetching creation time';
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Appdraw(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Icon(
              Icons.account_circle_outlined,
              size: 130,
            ),
            const SizedBox(height: 10),
            Text(
              username,
              style: TextStyle(
                fontSize: 28,
                fontFamily: GoogleFonts.alata().fontFamily,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.person_add_alt_1_outlined),
              label: const Text('Change Username'),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                backgroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.lock_outline_rounded),
              label: const Text('Change Password'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                foregroundColor: Colors.red,
              ),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 25),
            Text(
              formatCreationTime,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
