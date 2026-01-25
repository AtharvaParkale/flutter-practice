import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_practice/features/home/data/datasources/remote_datasource.dart';
import 'package:flutter_daily_practice/features/home/data/repository/home_repository_impl.dart';
import 'package:flutter_daily_practice/features/home/domain/usecases/get_users_usecase.dart';
import 'package:flutter_daily_practice/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_daily_practice/features/home/presentation/ui/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (BuildContext context) => HomeBloc(
          getUsersUseCase: GetUsersUseCase(
            homeRepository: HomeRepositoryImpl(
              remoteDataSource: HomeRemoteDatasourceImpl(),
            ),
          ),
        ),
        child: HomeScreen(),
      ),
    );
  }
}
