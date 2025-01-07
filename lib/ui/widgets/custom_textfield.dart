import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;

  const CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon, required String? Function(String? value) validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
