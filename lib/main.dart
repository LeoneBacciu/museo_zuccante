import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/core_container.dart';
import 'package:museo_zuccante/features/home/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CoreContainer.init();

  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
        providers: CoreContainer.getBlocProviders(),
        child: const MyApp(),
      ),
    );
  }, (e, s) {
    print('Error: $e\n $s');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museo Zuccante',
      theme: ThemeData(
        primarySwatch: Palette.primary,
      ),
      home: const HomePage(),
    );
  }
}
