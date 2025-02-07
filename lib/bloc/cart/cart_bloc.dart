import 'package:agony_coffee_app/bloc/cart/cart_event.dart';
import 'package:agony_coffee_app/bloc/cart/cart_state.dart';
import 'package:agony_coffee_app/models/cart_model.dart';
import 'package:agony_coffee_app/repository/cart_repsitory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartModel cartData = CartModel(totalPrice: 0, totalQuantity: 0, data: []);
  CartBloc(this.cartRepository) : super(CartInitialState()) {
    on<FetchCartEvent>((event, emit) async {
      try {
        emit(CartLoadingState(isLoading: true));
        final cart =
            await cartRepository.fetchCartByUserID(userID: event.userID);
        cartData = cart;
        emit((FetchCartSuccessState(cart: cart)));
        emit(CartLoadingState(isLoading: false));
      } catch (e) {
        emit(CartLoadingState(isLoading: false));
        emit(FetchCartErrorState(message: e.toString()));
      }
    });

    on<UpdateItemCartEvent>((event, emit) async {
      try {
        emit(CartLoadingState(isLoading: true));
        final cart = await cartRepository.updateCartQuantity(
          userID: event.userID,
          cartID: event.cartID,
          drinkID: event.drinkID,
          quantity: event.quantity,
        );
        cartData = cart;
        emit((UpdateItemCartSuccessState(cart: cart)));
        emit(CartLoadingState(isLoading: false));
      } catch (e) {
        emit(CartLoadingState(isLoading: false));
        print(e.toString());
      }
    });

    on<UpdateCartStatusEvent>((event, emit) async {
      try {
        emit(CartLoadingState(isLoading: true));
        cartRepository.updateCartStatus(
          cartID: event.cartID,
        );
        cartData = CartModel(totalPrice: 0, totalQuantity: 0, data: []);
        emit(UpdateCartStatusSuccessState());
        emit(CartLoadingState(isLoading: false));
      } catch (e) {
        emit(CartLoadingState(isLoading: false));
        emit(UpdateCartStatusErrorState(message: e.toString()));
      }
    });

    on<AddCartEvent>((event, emit) async {
      try {
        emit(CartLoadingState(isLoading: true));
        final cart = await cartRepository.addCart(
          userID: event.userID,
          drinkID: event.drinkID,
          price: event.price,
        );
        cartData = cart;
        emit(AddCartEventSuccessState(cart: cart));
        emit(CartLoadingState(isLoading: false));
      } catch (e) {
        emit(CartLoadingState(isLoading: false));
        emit(UpdateCartStatusErrorState(message: e.toString()));
      }
    });
  }
}
