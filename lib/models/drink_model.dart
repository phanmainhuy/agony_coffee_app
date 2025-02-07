import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel {
  @JsonKey(name: 'id')
  final int id;
  final String name;
  final double price;
  @JsonKey(name: 'category_id')
  final int categoryId;
  final String? iconUrl;
  @JsonKey(name: 'cart_quantity')
  final int cartQuantity;

  DrinkModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    this.iconUrl,
    required this.cartQuantity,
  });

  // Auto-generate fromJson & toJson
  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);
}
