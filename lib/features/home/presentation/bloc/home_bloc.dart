import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_daily_practice/commons/usecase.dart';
import 'package:flutter_daily_practice/features/home/domain/entities/user.dart';
import 'package:flutter_daily_practice/features/home/domain/usecases/get_users_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase _getUsersUseCase;

  HomeBloc({required GetUsersUseCase getUsersUseCase})
    : _getUsersUseCase = getUsersUseCase,
      super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetUsersEvent>(_onGetAllUsersEvent);
  }

  FutureOr<void> _onGetAllUsersEvent(
    GetUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());

      final users = await _getUsersUseCase.call(NoParams());

      emit(SuccessState(users: users));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
