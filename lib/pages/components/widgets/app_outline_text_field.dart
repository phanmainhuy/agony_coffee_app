import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_style.dart';
import 'package:flutter/material.dart';

class AppOutlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  const AppOutlineTextField({
    super.key,
    required this.controller,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusDefault),
        ),
        filled: true,
        fillColor: AppColors.backgroundColor,
      ),
    );
  }
}
