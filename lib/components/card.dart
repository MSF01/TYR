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
      height: 500,
      width: 350,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Column(
            children: [
              Stack(
                children: [
                  Ink.image(
                    image: const NetworkImage(
                      'https://images.unsplash.com/photo-1682685797743-3a7b6b8d8149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                    ),
                    height: 240,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
