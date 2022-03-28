import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:museo_zuccante/features/home/domain/home_repository.dart';
import 'package:museo_zuccante/models/item.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoad) {
        emit(HomeLoading());
        final items = await homeRepository.getItems();
        items.fold(
          (l) => emit(HomeLoaded(l)),
          (r) => emit(HomeError()),
        );
      }
    });
  }
}
