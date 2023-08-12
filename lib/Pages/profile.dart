import 'package:flutter/material.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({super.key});

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('The text'),
    );
  }
}
