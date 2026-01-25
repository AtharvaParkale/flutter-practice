part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SuccessState extends HomeState {
  final List<User> users;

  SuccessState({required this.users});
}

final class ErrorState extends HomeState {}

final class LoadingState extends HomeState {}
