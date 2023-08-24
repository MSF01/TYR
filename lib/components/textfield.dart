import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final controller;
  final String hint;
  final bool visible;
  final fillColor;
  final Icon? iconn;

  const TheTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.visible = false,
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
            icon: iconn ??
                Icon(
                  visible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
            onPressed: () {
              // Update the state to toggle the visibility of the password
              // You'll need to handle this in the parent widget
            },
          ),
        ),
        obscureText: visible,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
