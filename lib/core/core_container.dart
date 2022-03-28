import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:museo_zuccante/features/home/home_container.dart';
import 'package:museo_zuccante/features/item/item_container.dart';

final sl = GetIt.instance;

class CoreContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: 'http://localhost/api/')),
    );
    await HomeContainer.init();
    await ItemContainer.init();
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      ...HomeContainer.getBlocProviders(),
      ...ItemContainer.getBlocProviders(),
    ];
  }
}
