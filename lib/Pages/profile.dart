import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/login_page.dart';
import 'package:tyr/components/textfield.dart';

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

  final curPwd = TextEditingController();
  final newPwd = TextEditingController();

  void changePassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String? email = user!.email;

    String? password = curPwd.text;
    String? newPassword = newPwd.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password);
      user.updatePassword(newPassword).then((_) {
        print("Successfully changed password");
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void changePasswordDesign() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: const Center(child: Text('Change Password')),
            scrollable: true,
            content: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter current Password',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 72,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        hintText: 'Enter current password',
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      style: const TextStyle(fontSize: 22),
                      controller: curPwd,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter new Password',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 72,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        hintText: 'Enter new password',
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      style: const TextStyle(fontSize: 22),
                      controller: newPwd,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  // Here just pop it!
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(11.0),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel'),
              ),
              // const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () async {
                  // Call method to change password
                  changePassword();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(11.0),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Change'),
              ),
            ],
          ),
        );
      },
    );
  }

  void changeUsernameDesign() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: const Center(child: Text('Change Username')),
            scrollable: true,
            content: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Username',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 72,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        hintText: 'Enter new username',
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      style: const TextStyle(fontSize: 22),
                      controller: changUname,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  // Here just pop it!
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(11.0),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel'),
              ),
              // const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () async {
                  // Call method to change username
                  changeUsername();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(11.0),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Change'),
              ),
            ],
          ),
        );
      },
    );
  }

  void signOut() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('email');
    pref.remove('rememberMe');

    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  final changUname = TextEditingController();
  Future<void> changeUsername() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('username', changUname.text);
    setState(() {
      pref.toString();
    });
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
              onPressed: () {
                changeUsernameDesign();
              },
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
              onPressed: () {
                changePasswordDesign();
              },
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
              onPressed: () {
                signOut();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Joined: $formatCreationTime',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
