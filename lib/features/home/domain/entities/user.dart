import 'package:flutter_daily_practice/features/home/domain/entities/address.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/company.dart';

class User {
  final String name;
  final String email;
  final int id;
  final String? username;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    required this.username,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
    required this.name,
    required this.email,
    required this.id,
  });
}
