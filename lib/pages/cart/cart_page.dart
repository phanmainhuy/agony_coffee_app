import 'package:agony_coffee_app/bloc/cart/cart_bloc.dart';
import 'package:agony_coffee_app/bloc/cart/cart_event.dart';
import 'package:agony_coffee_app/bloc/cart/cart_state.dart';
import 'package:agony_coffee_app/constants/app_color.dart';
import 'package:agony_coffee_app/constants/text/app_text_style.dart';
import 'package:agony_coffee_app/models/cart_model.dart';
import 'package:agony_coffee_app/pages/cart/cart_list.dart';
import 'package:agony_coffee_app/pages/components/dialogs/error_dialog.dart';
import 'package:agony_coffee_app/pages/components/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  final int userID;

  const CartPage({
    super.key,
    required this.userID,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _totalPrice = 0;
  CartModel _cartData = CartModel(totalPrice: 0, totalQuantity: 0, data: []);

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchCartEvent(userID: widget.userID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Cart",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              if ((state as CartLoadingState).isLoading) {
                try {
                  LoadingDialog.show(context, message: "Loading...");
                } catch (e) {
                  LoadingDialog.hide(context);
                }
              } else {
                LoadingDialog.hide(context);
              }
              break;

            case FetchCartSuccessState:
              _cartData = (state as FetchCartSuccessState).cart;
              _totalPrice = _cartData.totalPrice;
              break;

            case UpdateItemCartSuccessState:
              _cartData = (state as UpdateItemCartSuccessState).cart;
              _totalPrice = _cartData.totalPrice;
              break;

            case UpdateCartStatusSuccessState:
              _cartData = CartModel(totalPrice: 0, totalQuantity: 0, data: []);
              _totalPrice = 0;
              break;

            case UpdateCartStatusErrorState:
              _showErrorDialog(
                message:
                    (state as UpdateCartStatusErrorState).message.toString(),
              );
              break;

            case FetchCartErrorState:
              _showErrorDialog(
                message: (state as FetchCartErrorState).message.toString(),
              );
              break;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Cart Items List
              Expanded(
                child: _cartData.data.isNotEmpty
                    ? CartList(
                        carts: _cartData.data,
                      )
                    : const Center(
                        child: Text(
                          'Empty Cart',
                          style: AppTextStyle.headingLargeBold,
                        ),
                      ),
              ),

              // Total Price and Checkout Button
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  border: Border(
                    top: BorderSide(
                        color: AppColors.secondaryTextColor.withOpacity(0.5)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Total Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        Text(
                          "\$${_totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Checkout Button
                    ElevatedButton(
                      onPressed: () {
                        if (_cartData.data.isNotEmpty) {
                          context.read<CartBloc>().add(
                                UpdateCartStatusEvent(
                                    cartID: _cartData.data[0].cartId),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Pay",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showErrorDialog({
    required String message,
  }) {
    ErrorDialog.show(
      context: context,
      title: "Cart Failed",
      content: message,
    );
  }
}
