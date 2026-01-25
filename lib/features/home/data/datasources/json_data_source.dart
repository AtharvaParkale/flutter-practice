import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_daily_practice/features/home/data/models/user_model.dart';

abstract interface class JsonDataSource {
  Future<List<UserModel>> getUsers();
}

class JsonDataSourceImpl implements JsonDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final jsonString = await rootBundle.loadString("assets/data.json");
      final List<dynamic> userData = jsonDecode(jsonString);
      return userData.map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
