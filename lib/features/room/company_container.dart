import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:museo_zuccante/features/room/domain/company_repository.dart';
import 'package:museo_zuccante/features/room/presentation/bloc/company_bloc.dart';

final sl = GetIt.instance;

class CompanyContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<CompanyRepository>(
      () => CompanyRepository(dio: sl()),
    );
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<CompanyBloc>(
        create: (context) => CompanyBloc(companyRepository: sl()),
      ),
    ];
  }
}
