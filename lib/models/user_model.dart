import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final int id;
  final int role;
  final String? name;
  final String? mobile;
  final String? email;
  final String? birthday;
  final String? gender;
  final String? address;
  final String? avatar;

  UserModel({
    required this.id,
    required this.role,
    this.name,
    this.mobile,
    this.email,
    this.birthday,
    this.gender,
    this.address,
    this.avatar,
  });

  // Auto-generate fromJson & toJson
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
