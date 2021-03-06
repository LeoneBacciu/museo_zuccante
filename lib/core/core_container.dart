import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:museo_zuccante/core/api_config.dart';
import 'package:museo_zuccante/features/home/home_container.dart';
import 'package:museo_zuccante/features/item/item_container.dart';
import 'package:museo_zuccante/features/room/company_container.dart';

final sl = GetIt.instance;

class CoreContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: ApiConfig.baseUrl)),
    );
    await HomeContainer.init();
    await ItemContainer.init();
    await CompanyContainer.init();
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      ...HomeContainer.getBlocProviders(),
      ...ItemContainer.getBlocProviders(),
      ...CompanyContainer.getBlocProviders(),
    ];
  }
}
