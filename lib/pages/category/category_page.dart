import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_routes.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/category/category_list.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_cart_badge.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final UserModel userModel;
  const CategoryPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          'Category Menu',
          style: TextStyle(color: AppColors.whiteColor),
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
      body: CategoryList(
        user: userModel,
      ),
    );
  }
}
