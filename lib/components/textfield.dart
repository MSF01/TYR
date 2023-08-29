import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final controller;
  final String hint;
  final bool obsecure;
  final fillColor;
  final IconButton? iconn;

  const TheTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obsecure = false,
    required this.fillColor,
    this.iconn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 18),
          fillColor: fillColor,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(
              true ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {},
          ),
        ),
        obscureText: obsecure,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
