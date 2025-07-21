import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      // Changed from TextField to TextFormField for validator
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator, // Added validator
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
