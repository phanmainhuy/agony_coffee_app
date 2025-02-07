import 'package:json_annotation/json_annotation.dart';
import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: 'total_price')
  final double totalPrice;

  @JsonKey(name: 'total_quantity')
  final int totalQuantity;

  final List<CartItemModel> data;

  CartModel({
    required this.totalPrice,
    required this.totalQuantity,
    required this.data,
  });

  // Auto-generate fromJson & toJson
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
