import 'dart:convert';

import 'package:agony_coffee_app/constants/api_const.dart';
import 'package:agony_coffee_app/constants/const.dart';
import 'package:agony_coffee_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$urlUserAPI/login'),
      headers: jsonHeaders,
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return UserModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to login');
      }
    }
  }

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final response = await http.post(
      Uri.parse('$urlUserAPI/register'),
      headers: jsonHeaders,
      body: jsonEncode({
        "email": email,
        "name": name,
        "password": password,
        "mobile": phone,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return UserModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to register');
      }
    }
  }

  Future<List<UserModel>> fetchAllUser() async {
    final response = await http.get(
      Uri.parse('$urlUserAPI/all'),
      headers: jsonHeaders,
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return jsonData.map((json) => UserModel.fromJson(json)).toList();
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

  Future<dynamic> deleteUser({required String userID}) async {
    final response = await http.delete(
      Uri.parse('$urlUserAPI/delete'),
      headers: jsonHeaders,
      body: jsonEncode({
        "user_id": userID,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return jsonData;
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to login');
      }
    }
  }

  Future<UserModel> updateUser({
    required String email,
    required String name,
    required String phone,
  }) async {
    final response = await http.put(
      Uri.parse('$urlUserAPI/update'),
      headers: jsonHeaders,
      body: jsonEncode({
        "email": email,
        "name": name,
        "mobile": phone,
      }),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');

      return UserModel.fromJson(jsonData);
    } else {
      print(
          'status: ${response.statusCode} \nresponse.body: \n${response.body.toString()}');
      if (response.statusCode == 400) {
        throw Exception(response.body.toString());
      } else {
        throw Exception('Failed to register');
      }
    }
  }
}
