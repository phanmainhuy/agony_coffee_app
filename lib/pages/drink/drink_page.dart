import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/models/category_model.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_cart_badge.dart';
import 'package:agony_coffee_app/pages/drink/drink_list.dart';
import 'package:flutter/material.dart';

class DrinkPage extends StatelessWidget {
  final UserModel userModel;
  final CategoryModel category;

  const DrinkPage({
    super.key,
    required this.userModel,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          '${category.name} Menu',
          style: const TextStyle(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
        actions: [
          AppCartBadge(
            userModel: userModel,
          ),
          IconButton(
            onPressed: () {
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                RouteName.loginRoute,
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: DrinkList(
        userModel: userModel,
        categoryModel: category,
      ),
    );
  }
}
