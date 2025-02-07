import 'package:agony_coffee_app/models/cart_model.dart';

abstract class CartState {}

final class CartInitialState extends CartState {}

class CartLoadingState extends CartState {
  final bool isLoading;
  CartLoadingState({required this.isLoading});
}

class FetchCartSuccessState extends CartState {
  final CartModel cart;
  FetchCartSuccessState({required this.cart});
}

class FetchCartErrorState extends CartState {
  final String? message;

  FetchCartErrorState({this.message});
}

class UpdateItemCartSuccessState extends CartState {
  final CartModel cart;
  UpdateItemCartSuccessState({required this.cart});
}

class UpdateCartStatusSuccessState extends CartState {}

class UpdateCartStatusErrorState extends CartState {
  final String? message;

  UpdateCartStatusErrorState({this.message});
}

class AddCartEventSuccessState extends CartState {
  final CartModel cart;
  AddCartEventSuccessState({required this.cart});
}

class AddCartEventErrorState extends CartState {
  final String? message;

  AddCartEventErrorState({this.message});
}
