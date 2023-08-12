import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({super.key});

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Appdraw(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Text('The text'),
    );
  }
}
