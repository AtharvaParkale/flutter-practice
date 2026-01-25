import 'package:flutter_daily_practice/features/home/data/datasources/json_data_source.dart';
import 'package:flutter_daily_practice/features/home/data/datasources/remote_datasource.dart';
import 'package:flutter_daily_practice/features/home/data/datasources/shared_preferences_datasource.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';
import 'package:flutter_daily_practice/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final JsonDataSourceImpl jsonDataSource;
  final SharedPreferencesDatasource sharedPreferencesDatasource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.jsonDataSource,
    required this.sharedPreferencesDatasource,
  });

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final localData = await sharedPreferencesDatasource.getAllUsers();

      if (localData.isNotEmpty) return localData;

      final users = await jsonDataSource.getUsers();

      sharedPreferencesDatasource.saveAllUsers(users);

      return users.map((user) {
        return user as User;
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
