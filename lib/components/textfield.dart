import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final controller;
  final String hint;
  final Icon? preIcon;
  final Icon? sufIcon;
  final double? size;
  final int? lines;
  final Function()? onTap;

  const TheTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.preIcon,
    this.sufIcon,
    required this.size,
    this.lines,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          hintText: hint,
          hintStyle: TextStyle(fontSize: size),
          filled: true,
        ),
        maxLines: lines,
        onTap: onTap,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
