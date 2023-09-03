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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(
                'https://c4.wallpaperflare.com/wallpaper/427/363/780/bejeweled-bejeweled-3-beyond-reality-fantasy-art-wallpaper-preview.jpg'),
          ),
        ],
      ),
    );
  }
}
