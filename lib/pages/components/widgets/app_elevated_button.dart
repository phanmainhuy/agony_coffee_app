import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_style.dart';
import 'package:agony_coffee_app/constants/text/app_text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onPress;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry? padding;

  const AppElevatedButton({
    super.key,
    this.buttonText,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.onPress,
    this.buttonTextStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? buttonHeightDefault,
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? borderRadiusDefault,
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(
            backgroundColor ?? AppColors.primaryColor,
          ),
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0.0,
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          buttonText ?? '',
          style: buttonTextStyle ?? AppTextStyle.buttonPrimaryTextNoBold,
        ),
      ),
    );
  }
}
