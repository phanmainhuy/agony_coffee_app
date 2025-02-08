import 'dart:convert';

import 'package:agony_coffee_app/constants/api_const.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  Future<CartModel> fetchCartByUserID({required int userID}) async {
    final response = await http.get(
      Uri.parse('$urlCartPI/get?user_id=$userID'),
      headers: jsonHeaders,
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      return CartModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch cart');
      }
    }
  }

  Future<CartModel> updateCartQuantity({
    required int userID,
    required int cartID,
    required int drinkID,
    required int quantity,
  }) async {
    final response = await http.put(
      Uri.parse('$urlCartPI/update'),
      headers: jsonHeaders,
      body: jsonEncode({
        "user_id": userID,
        "cart_id": cartID,
        "drink_id": drinkID,
        "quantity": quantity,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      return CartModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch cart');
      }
    }
  }

  Future<CartModel> addCart({
    required int userID,
    required int drinkID,
    required double price,
  }) async {
    final response = await http.post(
      Uri.parse('$urlCartPI/add'),
      headers: jsonHeaders,
      body: jsonEncode({
        "user_id": userID,
        "cart_details": [
          {
            "drink_id": drinkID,
            "quantity": 1,
            "price": price,
          },
        ]
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'addCart status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      return CartModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch cart');
      }
    }
  }

  void deleteCartItem({
    required int userID,
    required int cartID,
    required int drinkID,
    required int quantity,
  }) async {
    final response = await http.put(
      Uri.parse('$urlCartPI/delete'),
      headers: jsonHeaders,
      body: jsonEncode({
        "user_id": userID,
        "cart_id": cartID,
        "drink_id": drinkID,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch cart');
      }
    }
  }

  void updateCartStatus({required int cartID}) async {
    final response = await http.post(
      Uri.parse('$urlCartPI/checkout'),
      headers: jsonHeaders,
      body: jsonEncode({
        "cart_id": cartID,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch cart');
      }
    }
  }
}
