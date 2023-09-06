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
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const NetworkImage(
                    'https://c1.wallpaperflare.com/preview/812/509/106/clock-time-old-roman.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 260),
              ],
            ),
            const Text(
              'DATA',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
