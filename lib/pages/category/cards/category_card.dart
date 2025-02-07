import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:agony_coffee_app/models/category_model.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_image_asset.dart';
import 'package:agony_coffee_app/pages/drink/drink_page.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final UserModel user;
  const CategoryCard({super.key, required this.category, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push<CategoryModel>(
          MaterialPageRoute(
            builder: (_) => DrinkPage(userModel: user, category: category),
          ),
        );
      },
      child: Card(
        elevation: 2,
        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.accentColor,
                child: category.iconUrl != null
                    ? AppImageAsset(
                        imagePath:
                            AppURLImage.urlCategoriesImage + category.iconUrl!,
                        width: 48,
                        height: 48,
                      )
                    : Text(
                        category.name.isNotEmpty
                            ? category.name[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),

              const SizedBox(width: 16),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(Icons.navigate_next),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
