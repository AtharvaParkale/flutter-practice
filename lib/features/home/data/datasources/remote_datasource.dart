import 'dart:convert';

import 'package:flutter_daily_practice/features/home/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract interface class HomeRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final data = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      final List<dynamic> users = jsonDecode(data.body);
      return users.map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
