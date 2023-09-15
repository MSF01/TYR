import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final controller;
  final String hint;
  final Icon? icon;
  final double? size;

  const TheTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    required this.size,
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
          prefixIcon: icon,
          hintText: hint,
          hintStyle: TextStyle(fontSize: size),
          filled: true,
        ),
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
