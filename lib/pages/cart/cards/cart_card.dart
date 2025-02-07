import 'package:agony_coffee_app/bloc/cart/cart_bloc.dart';
import 'package:agony_coffee_app/bloc/cart/cart_event.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/app_url_image.dart';
import 'package:agony_coffee_app/models/cart_item_model.dart';
import 'package:agony_coffee_app/pages/components/widgets/app_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatefulWidget {
  final CartItemModel cartItem;

  const CartCard({
    super.key,
    required this.cartItem,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.cartItem;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          item.drinkName,
          style: const TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price: \$${item.price.toStringAsFixed(2)}",
              style: const TextStyle(color: AppColors.secondaryTextColor),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                    context.read<CartBloc>().add(UpdateItemCartEvent(
                          userID: item.userId,
                          drinkID: item.drinkId,
                          quantity: quantity,
                          cartID: item.cartId,
                        ));
                  },
                  icon: const Icon(Icons.remove),
                  color: AppColors.primaryColor,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                    context.read<CartBloc>().add(UpdateItemCartEvent(
                          userID: item.userId,
                          drinkID: item.drinkId,
                          quantity: quantity,
                          cartID: item.cartId,
                        ));
                  },
                  icon: const Icon(Icons.add),
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          "\$${(item.price * quantity).toStringAsFixed(2)}",
          style: const TextStyle(
            color: AppColors.accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        leading: item.iconUrl != null
            ? AppImageAsset(
                imagePath: AppURLImage.urlDrinksImage + item.iconUrl!,
                width: 50,
                height: 50)
            : const Icon(Icons.local_cafe),
      ),
    );
  }
}
