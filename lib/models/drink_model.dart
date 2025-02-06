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

  DrinkModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    this.iconUrl,
  });

  // Auto-generate fromJson & toJson
  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);
}
