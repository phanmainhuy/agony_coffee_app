import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle headingMediumNoBoldStyle = TextStyle(
    fontSize: 34,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle headingLargeBold = TextStyle(
    fontSize: 32,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 28,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 24,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headingSmallBold = TextStyle(
    fontSize: 24,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.secondaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonPrimaryTextNoBold = TextStyle(
    fontSize: 16,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttonWhiteTextNoBold = TextStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 14,
    color: Colors.blue,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
