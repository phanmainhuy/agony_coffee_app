import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  @JsonKey(name: 'cart_id')
  final int cartId;

  @JsonKey(name: 'drink_id')
  final int drinkId;

  @JsonKey(name: 'drink_name')
  final String drinkName;

  final int quantity;

  final double price;

  @JsonKey(name: 'total_price')
  final double totalPrice;

  @JsonKey(name: 'user_id')
  final int userId;

  final String? iconUrl;

  CartItemModel({
    required this.cartId,
    required this.drinkId,
    required this.drinkName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.userId,
    this.iconUrl,
  });

  // Auto-generate fromJson & toJson
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
