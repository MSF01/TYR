import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  final String description;
  final Function() onTap;

  TheCard({super.key, required this.onTap, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text(
              description,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
