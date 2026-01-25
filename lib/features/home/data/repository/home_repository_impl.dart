import 'package:flutter_daily_practice/features/home/data/datasources/remote_datasource.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';
import 'package:flutter_daily_practice/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final users = await remoteDataSource.getAllUsers();
      return users.map((user) {
        return user as User;
      }).toList();
    } catch (e, stk) {
      throw Exception(e);
    }
  }
}
