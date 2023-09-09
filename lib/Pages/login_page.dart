import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyr/Pages/home.dart';
import 'package:tyr/Pages/register_page.dart';
import 'package:tyr/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
bool rememberMe = false;

User? userr = _auth.currentUser;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

  Future<bool> checkUser() async {
    if (rememberMe == true) {
      if (userr != null) {
        return true;
      }
    }
    return false;
  }
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final pref = await SharedPreferences.getInstance();
    var usser = pref.getString('email');
    bool remember = pref.getBool('rememberMe') ?? false;

    if (usser != null && usser.isNotEmpty && remember) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const Home())));
    } else {
      setState(() {
        email.text = usser.toString();
        rememberMe = remember;
      });
    }
  }

  void saveUser(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('rememberMe', value);
    if (value) {
      pref.setString('email', email.text);
    } else {
      pref.remove('email');
    }
    setState(() {
      rememberMe = value;
    });
  }

  void signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(
          () {
            warning = 'User is not founded';
          },
        );
      } else if (e.code == 'wrong-password') {
        setState(
          () {
            warning = 'Password you used is wrong!';
          },
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  final email = TextEditingController();
  final password = TextEditingController();

  String warning = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 120),
              const Icon(
                Icons.person,
                size: 100,
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to TYR',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TheTextField(
                  controller: email,
                  hint: 'Email',
                  obsecure: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TheTextField(
                  controller: password,
                  hint: 'Password',
                  obsecure: true,
                  iconn: IconButton(
                    icon: const Icon(
                      true ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 17),
                  Checkbox(
                    activeColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: rememberMe,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) {
                      saveUser(value!);
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 65),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                warning,
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 20,
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () async {
                  // remember
                  signIn();
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[500],
                      indent: 100,
                      endIndent: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      ' Register Now',
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 20,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
