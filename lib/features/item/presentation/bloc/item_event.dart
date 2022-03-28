part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object?> get props => [];
}

class ItemLoad extends ItemEvent {
  final String id;

  const ItemLoad(this.id);

  @override
  List<Object?> get props => [id];
}
