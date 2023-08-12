import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyr/components/app_drawer.dart';
import 'package:tyr/components/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String username = '';
String email = '';

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Appdraw(),
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
