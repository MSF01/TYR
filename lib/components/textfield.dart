import 'package:flutter/material.dart';

class TheTextField extends StatelessWidget {
  final controller;
  final String hint;
  final Icon? preIcon;
  final Icon? sufIcon;
  final double? size;
  final int? lines;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? counterText;
  final bool readOnly;

  const TheTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.preIcon,
    this.sufIcon,
    required this.size,
    this.lines,
    this.onTap,
    this.counterText,
    this.onChanged,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        onChanged: onChanged,
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
          counterStyle: const TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
          counterText: counterText,
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          hintText: hint,
          hintStyle: TextStyle(fontSize: size),
          filled: true,
        ),
        maxLines: lines,
        readOnly: readOnly,
        onTap: onTap,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
