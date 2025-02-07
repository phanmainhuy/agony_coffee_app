// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      cartId: (json['cart_id'] as num).toInt(),
      drinkId: (json['drink_id'] as num).toInt(),
      drinkName: json['drink_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      userId: (json['user_id'] as num).toInt(),
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'cart_id': instance.cartId,
      'drink_id': instance.drinkId,
      'drink_name': instance.drinkName,
      'quantity': instance.quantity,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'user_id': instance.userId,
      'iconUrl': instance.iconUrl,
    };
