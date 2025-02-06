import 'package:agony_coffee_app/constants/text/app_text_style.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_text_field.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_text_field_password.dart';
import 'package:flutter/material.dart';

class AppTextFieldTitle extends StatelessWidget {
  final TextEditingController textController;
  final String textTitle;
  final String? hintText;
  final bool? isPassword;

  const AppTextFieldTitle(
      {super.key,
      required this.textTitle,
      required this.textController,
      this.hintText,
      this.isPassword});

  @override
  Widget build(BuildContext context) {
    bool password = isPassword ?? false;
    return Column(
      children: [
        _titleEditText(textTitle: textTitle),
        password
            ? AppTextFieldPassword(
                controller: textController,
                hintText: 'Min. 8 characters',
              )
            : AppTextField(
                controller: textController,
                hintText: hintText ?? '',
              ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _titleEditText({required String textTitle}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            textTitle,
            style: AppTextStyle.caption,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
