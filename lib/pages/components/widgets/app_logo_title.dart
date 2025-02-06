import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/constants/text/app_text_style.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_image_asset.dart';
import 'package:flutter/material.dart';

class AppLogoTitle extends StatelessWidget {
  const AppLogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Logo & Title
        AppImageAsset(
          imagePath: AppURLImage.urlLogoImage,
          width: 120,
          height: 120,
        ),
        SizedBox(height: 8),
        Text(
          appName,
          style: AppTextStyle.headingSmallBold,
        ),
        SizedBox(height: 4),
        Text(
          'Work without limits',
          style: AppTextStyle.bodyLarge,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
