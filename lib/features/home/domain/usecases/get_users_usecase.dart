import 'package:flutter_daily_practice/commons/usecase.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';
import 'package:flutter_daily_practice/features/home/domain/repositories/home_repository.dart';

class GetUsersUseCase implements UseCase<List<User>, NoParams> {
  final HomeRepository homeRepository;

  GetUsersUseCase({required this.homeRepository});

  @override
  Future<List<User>> call(params) async {
    return await homeRepository.getAllUsers();
  }
}
