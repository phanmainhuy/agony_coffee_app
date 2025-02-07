// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      totalPrice: (json['total_price'] as num).toDouble(),
      totalQuantity: (json['total_quantity'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'total_price': instance.totalPrice,
      'total_quantity': instance.totalQuantity,
      'data': instance.data,
    };
