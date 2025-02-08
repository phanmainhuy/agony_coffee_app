import 'package:agony_coffee_app/bloc/cart/cart_bloc.dart';
import 'package:agony_coffee_app/bloc/cart/cart_event.dart';
import 'package:agony_coffee_app/bloc/cart/cart_state.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCartBadge extends StatefulWidget {
  final UserModel userModel;
  final VoidCallback? onPressed;

  const AppCartBadge({
    super.key,
    this.onPressed,
    required this.userModel,
  });

  @override
  State<AppCartBadge> createState() => _AppCartBadgeState();
}

class _AppCartBadgeState extends State<AppCartBadge> {
  int itemCount = 0;
  @override
  void initState() {
    super.initState();
    // cart number

    // Access the current CartBloc state
    final cartState = context.read<CartBloc>().state;

    // Check if the cart is already loaded and update the itemCount
    if (cartState is FetchCartSuccessState) {
      itemCount = cartState.cart.totalQuantity;
    } else if (context.read<CartBloc>().cartData.totalQuantity > 0) {
      itemCount = context.read<CartBloc>().cartData.totalQuantity;
    }

    // Fetch the cart in case it's not yet loaded
    context.read<CartBloc>().add(FetchCartEvent(userID: widget.userModel.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case FetchCartSuccessState:
            itemCount = (state as FetchCartSuccessState).cart.totalQuantity;
            break;
          case UpdateCartStatusSuccessState:
            itemCount = 0;
            break;
          case UpdateItemCartSuccessState:
            itemCount =
                (state as UpdateItemCartSuccessState).cart.totalQuantity;
            break;
          case AddCartEventSuccessState:
            itemCount = (state as AddCartEventSuccessState).cart.totalQuantity;
            break;
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            IconButton(
              onPressed: () {
                widget.onPressed;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      userID: widget.userModel.id,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.whiteColor,
              ),
            ),
            if (itemCount > 0) // Show badge only if itemCount > 0
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
