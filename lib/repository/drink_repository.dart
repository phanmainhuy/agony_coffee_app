import 'dart:convert';

import 'package:agony_coffee_app/constants/api_const.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/models/drink_model.dart';
import 'package:http/http.dart' as http;

class DrinkRepository {
  Future<List<DrinkModel>> fetchAllDrinks() async {
    final response = await http.get(
      Uri.parse('$urlDrinkAPI/all'),
      headers: jsonHeaders,
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return jsonData.map((json) => DrinkModel.fromJson(json)).toList();
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch all users');
      }
    }
  }

  Future<List<DrinkModel>> fetchDrinksByCategoryID(
      {required int categoryID, required int userID}) async {
    final response = await http.get(
      Uri.parse('$urlDrinkAPI/user?category_id=$categoryID&user_id=$userID'),
      headers: jsonHeaders,
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return jsonData.map((json) => DrinkModel.fromJson(json)).toList();
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch all users');
      }
    }
  }
}
