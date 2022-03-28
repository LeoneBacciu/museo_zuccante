part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Item> rooms;

  const HomeLoaded(this.rooms);

  @override
  List<Object> get props => [rooms];
}

class HomeError extends HomeState {}
