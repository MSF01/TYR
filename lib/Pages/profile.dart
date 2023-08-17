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
      drawer: const Appdraw(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.account_circle_outlined,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
