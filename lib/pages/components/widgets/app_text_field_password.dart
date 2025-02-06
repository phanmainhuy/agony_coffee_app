import 'package:agony_coffee_app/constants/app_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldPassword extends StatefulWidget {
  final double? height;
  final TextEditingController controller;
  final String hintText;

  const AppTextFieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
    this.height,
  });

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool _obscureText = true; // Initial state of password visibility

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? editTextHeightDefault,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusDefault),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle password visibility
              });
            },
          ),
        ),
      ),
    );
  }
}
