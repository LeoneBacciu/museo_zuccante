import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:museo_zuccante/features/home/domain/home_repository.dart';
import 'package:museo_zuccante/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

class HomeContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepository(dio: sl()),
    );
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(homeRepository: sl()),
      ),
    ];
  }
}
