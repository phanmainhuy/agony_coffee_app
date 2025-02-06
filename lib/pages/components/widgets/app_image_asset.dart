import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:flutter/material.dart';

class AppImageAsset extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;

  const AppImageAsset({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppURLImage.urlNoImageAsset,
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
