import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  final controller;
  final String hint;
  bool obsecure;
  final IconButton? iconn;

  PasswordTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obsecure = true,
    this.iconn,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: const Color(0xFF1A1A1A),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 18),
          filled: true,
          suffixIcon: IconButton(
              icon: widget.obsecure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  widget.obsecure = !widget.obsecure;
                });
              }),
        ),
        obscureText: widget.obsecure,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
