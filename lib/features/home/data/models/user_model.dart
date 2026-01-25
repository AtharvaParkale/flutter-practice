import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.email, required super.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email'], id: json['id']);
  }
}
