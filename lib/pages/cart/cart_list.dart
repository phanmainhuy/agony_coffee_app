import 'package:agony_coffee_app/models/cart_item_model.dart';
import 'package:agony_coffee_app/pages/cart/cards/cart_card.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final List<CartItemModel> carts;

  const CartList({
    super.key,
    required this.carts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carts.length,
      itemBuilder: (context, index) {
        final item = carts[index];
        return CartCard(
          cartItem: item,
        );
      },
    );
  }
}
