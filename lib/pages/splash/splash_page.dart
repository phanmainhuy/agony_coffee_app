import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/constants/text/app_text_style.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_divider.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 1700), () {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        RouteName.loginRoute,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppImageAsset(
              imagePath: AppURLImage.urlLogoImage,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 200,
              child: AppDivider(
                padding: EdgeInsets.only(top: 4),
                thickness: 4,
                color: AppColors.primaryTextColor,
              ),
            ),
            Text(
              appName,
              style: AppTextStyle.headingMedium,
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 24,
              width: 24,
              child: CupertinoActivityIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
