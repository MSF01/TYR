import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  final String title;
  final String description;
  final Function() onTap;

  const TheCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 330,
      child: Card(
        color: Colors.black26,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const NetworkImage(
                    'https://wallpaperaccess.com/full/1536530.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 240),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
