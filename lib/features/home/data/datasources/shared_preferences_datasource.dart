import 'dart:convert';

import 'package:flutter_daily_practice/features/home/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPreferencesDatasource {
  Future<List<UserModel>> getAllUsers();

  Future<void> saveAllUsers(List<UserModel> users);
}

class SharedPreferencesImpl implements SharedPreferencesDatasource {
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final jsonString = prefs.getString('users');

      if (jsonString == null) return [];

      final List<dynamic> data = jsonDecode(jsonString);

      return data.map((elem) => UserModel.fromJson(elem)).toList();
    } catch (e, stk) {

      throw Exception(e);
    }
  }

  @override
  Future<void> saveAllUsers(List<UserModel> users) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Convert List<UserModel> → List<Map>
      final List<Map<String, dynamic>> jsonList = users
          .map((user) => user.toJson())
          .toList();

      // Encode List<Map> → String
      final String encodedData = jsonEncode(jsonList);

      // Save to SharedPreferences
      await prefs.setString('users', encodedData);
    } catch (e) {
      throw Exception('Failed to save users: $e');
    }
  }
}
