import 'package:flutter/material.dart';

class CharacterLimitTextField extends StatefulWidget {
  final controller;
  final String? hint;
  final int? lines;

  const CharacterLimitTextField(
      {super.key, this.controller, this.hint, this.lines});

  @override
  State<CharacterLimitTextField> createState() =>
      _CharacterLimitTextFieldState();
}

class _CharacterLimitTextFieldState extends State<CharacterLimitTextField> {
  String? counterText;
  int counterTextLimit = 180;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            counterText = (counterTextLimit - value.length).toString();
          });
        },
        maxLength: counterTextLimit,
        textAlign: TextAlign.start,
        controller: widget.controller,
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
            color: Colors.white,
            fontSize: 18,
          ),
          counterText: "Remaining: $counterText",
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 18),
          filled: true,
        ),
        maxLines: widget.lines,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
