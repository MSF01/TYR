import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? fontSize;

  const GradientButton(
      {super.key, required this.onPressed, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42),
                gradient: const LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.purple,
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
