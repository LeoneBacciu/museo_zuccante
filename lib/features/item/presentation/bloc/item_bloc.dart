import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:museo_zuccante/features/item/domain/item_repository.dart';
import 'package:museo_zuccante/models/item.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({required this.itemRepository}) : super(ItemInitial()) {
    on<ItemEvent>((event, emit) async {
      if (event is ItemLoad) {
        emit(ItemLoading());
        final item = await itemRepository.getItem(event.id);
        item.fold(
          (l) => emit(ItemLoaded(l)),
          (r) => emit(ItemError()),
        );
      }
    });
  }
}
