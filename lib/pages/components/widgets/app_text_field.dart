import 'package:agony_coffee_app/constants/app_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final Function()? onTogglePasswordVisibility;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: editTextHeightDefault,
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscureText : false,
        keyboardType:
            isPassword ? TextInputType.text : TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusDefault),
            borderSide: BorderSide.none,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onTogglePasswordVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
