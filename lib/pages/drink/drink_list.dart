import 'package:agony_coffee_app/bloc/cart/cart_bloc.dart';
import 'package:agony_coffee_app/bloc/cart/cart_event.dart';
import 'package:agony_coffee_app/bloc/cart/cart_state.dart';
import 'package:agony_coffee_app/bloc/drink/drink_bloc.dart';
import 'package:agony_coffee_app/bloc/drink/drink_event.dart';
import 'package:agony_coffee_app/bloc/drink/drink_state.dart';
import 'package:agony_coffee_app/models/category_model.dart';
import 'package:agony_coffee_app/models/drink_model.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:agony_coffee_app/pages/components/dialogs/loading_dialog.dart';
import 'package:agony_coffee_app/pages/drink/cards/drink_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkList extends StatefulWidget {
  final UserModel userModel;
  final CategoryModel categoryModel;

  const DrinkList({
    super.key,
    required this.userModel,
    required this.categoryModel,
  });

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  late List<DrinkModel> drinks = [];

  @override
  void initState() {
    super.initState();
    context.read<DrinkBloc>().add(FetchDrinksByCategoryIDEvent(
          categoryID: widget.categoryModel.id,
          userID: widget.userModel.id,
        ));
  }

  void _incrementQuantity(int index) {
    setState(() {
      drinks[index] = DrinkModel(
        id: drinks[index].id,
        name: drinks[index].name,
        price: drinks[index].price,
        categoryId: drinks[index].categoryId,
        iconUrl: drinks[index].iconUrl,
        cartQuantity: drinks[index].cartQuantity + 1,
      );
    });

    context.read<CartBloc>().add(
          AddCartEvent(
              userID: widget.userModel.id,
              drinkID: drinks[index].id,
              price: drinks[index].price),
        );
  }

  void _decrementQuantity(int index) {
    if (drinks[index].cartQuantity > 0) {
      setState(() {
        drinks[index] = DrinkModel(
          id: drinks[index].id,
          name: drinks[index].name,
          price: drinks[index].price,
          categoryId: drinks[index].categoryId,
          iconUrl: drinks[index].iconUrl,
          cartQuantity: drinks[index].cartQuantity - 1,
        );
      });
      final cartData = context.read<CartBloc>().cartData;
      context.read<CartBloc>().add(UpdateItemCartEvent(
            userID: widget.userModel.id,
            drinkID: drinks[index].id,
            quantity: drinks[index].cartQuantity - 1,
            cartID: cartData.data[0].cartId,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrinkBloc, DrinkState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case DrinkLoadingState:
            if ((state as DrinkLoadingState).isLoading) {
              try {
                LoadingDialog.show(context, message: "Loading...");
              } catch (e) {
                LoadingDialog.hide(context);
              }
            } else {
              LoadingDialog.hide(context);
            }
            break;

          case FetchDrinksByCategoryIDSuccessState:
            drinks = (state as FetchDrinksByCategoryIDSuccessState).drinkList;
            break;
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            final drink = drinks[index];

            return DrinkCard(
              drink: drink,
              onIncrement: () => _incrementQuantity(index),
              onDecrement: () => _decrementQuantity(index),
            );
          },
        );
      },
    );
  }
}
