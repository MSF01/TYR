import 'package:flutter/material.dart';

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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
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
