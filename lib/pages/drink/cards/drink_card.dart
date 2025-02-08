import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:agony_coffee_app/models/drink_model.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_image_asset.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  final DrinkModel drink;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const DrinkCard({
    super.key,
    required this.drink,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: drink.iconUrl != null
            ? AppImageAsset(
                imagePath: AppURLImage.urlDrinksImage + drink.iconUrl!,
                width: 50,
                height: 50)
            : const Icon(Icons.local_cafe),
        title: Text(
          drink.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "\$${drink.price.toStringAsFixed(2)}",
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (drink.cartQuantity > 0)
              IconButton(
                onPressed: onDecrement,
                icon: const Icon(Icons.remove, color: Colors.red),
              ),
            Text(
              drink.cartQuantity > 0 ? '${drink.cartQuantity}' : '',
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
