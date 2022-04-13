part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final Item item;

  const ItemLoaded(this.item);

  @override
  List<Object> get props => [item];
}

class ItemError extends ItemState {
  final Exception e;

  const ItemError(this.e);
}
