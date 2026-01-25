import 'package:flutter_daily_practice/features/home/data/models/address_model.dart';
import 'package:flutter_daily_practice/features/home/data/models/comapany_model.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.username,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      phone: json['phone'],
      website: json['website'],
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
    );
  }
}
