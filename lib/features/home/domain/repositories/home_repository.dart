import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';

abstract interface class HomeRepository {
  Future<List<User>> getAllUsers();
}
