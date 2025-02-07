import 'dart:convert';

import 'package:agony_coffee_app/constants/api_const.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<CategoryModel>> fetchAllCategories() async {
    final response = await http.get(
      Uri.parse('$urlCategoryAPI/all'),
      headers: jsonHeaders,
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return jsonData.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to fetch categories');
      }
    }
  }
}
