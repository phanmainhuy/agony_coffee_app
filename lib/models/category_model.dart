import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'id')
  final int id;
  final String name;
  final String iconUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  // Auto-generate fromJson & toJson
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
