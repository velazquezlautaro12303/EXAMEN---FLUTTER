import 'package:flutter/material.dart';

class MyTextFieldPassword extends StatefulWidget {
  MyTextFieldPassword({super.key});

  bool isPasswordVisible = false;
  TextEditingController passwordController = TextEditingController();

  @override
  State<MyTextFieldPassword> createState() => _MyTextFieldPasswordState();
}

class _MyTextFieldPasswordState extends State<MyTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !widget.isPasswordVisible,
      controller: widget.passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Password',
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.isPasswordVisible = !widget.isPasswordVisible;
            });
          },
          icon: widget.isPasswordVisible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
    );
  }
}
