import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:museo_zuccante/features/item/domain/item_repository.dart';
import 'package:museo_zuccante/features/item/presentation/bloc/item_bloc.dart';

final sl = GetIt.instance;

class ItemContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<ItemRepository>(
      () => ItemRepository(dio: sl()),
    );
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<ItemBloc>(
        create: (context) => ItemBloc(itemRepository: sl()),
      ),
    ];
  }
}
