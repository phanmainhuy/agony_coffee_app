abstract class CartEvent {}

class FetchCartEvent extends CartEvent {
  final int userID;
  FetchCartEvent({required this.userID});
}

class UpdateItemCartEvent extends CartEvent {
  final int userID;
  final int cartID;
  final int drinkID;
  final int quantity;

  UpdateItemCartEvent({
    required this.userID,
    required this.cartID,
    required this.drinkID,
    required this.quantity,
  });
}

class UpdateCartStatusEvent extends CartEvent {
  final int cartID;

  UpdateCartStatusEvent({
    required this.cartID,
  });
}

class AddCartEvent extends CartEvent {
  final int userID;
  final int drinkID;
  final double price;

  AddCartEvent({
    required this.userID,
    required this.drinkID,
    required this.price,
  });
}
