import 'package:flutter_daily_practice/features/home/data/datasources/json_data_source.dart';
import 'package:flutter_daily_practice/features/home/data/datasources/remote_datasource.dart';
import 'package:flutter_daily_practice/features/home/data/datasources/shared_preferences_datasource.dart';
import 'package:flutter_daily_practice/features/home/data/repository/home_repository_impl.dart';
import 'package:flutter_daily_practice/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_daily_practice/features/home/domain/usecases/get_users_usecase.dart';
import 'package:flutter_daily_practice/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator
    ..registerFactory<HomeRemoteDataSource>(() => HomeRemoteDatasourceImpl())
    ..registerFactory<SharedPreferencesDatasource>(
      () => SharedPreferencesImpl(),
    )
    ..registerFactory<JsonDataSource>(() => JsonDataSourceImpl())
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: serviceLocator(),
        sharedPreferencesDatasource: serviceLocator(),
        jsonDataSource: serviceLocator(),
      ),
    )
    ..registerFactory<GetUsersUseCase>(
      () => GetUsersUseCase(homeRepository: serviceLocator()),
    )
    ..registerFactory<HomeBloc>(
      () => HomeBloc(getUsersUseCase: serviceLocator()),
    );
}
