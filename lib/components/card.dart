import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  final String title;
  final String description;
  final Function() onTap;

  TheCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 200,
          height: 100,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
