part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetUsersEvent extends HomeEvent {}
