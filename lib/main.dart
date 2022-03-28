import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/core_container.dart';
import 'package:museo_zuccante/core/url_path.dart';
import 'package:museo_zuccante/features/home/presentation/home_page.dart';
import 'package:museo_zuccante/features/item/presentation/item_page.dart';

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
      onGenerateRoute: (RouteSettings settings) {
        final name = settings.name;
        if (name != null) {
          for (UrlPath path in paths) {
            final regExpPattern = RegExp(path.pattern);
            if (regExpPattern.hasMatch(name)) {
              final match = regExpPattern.firstMatch(name)?.group(1);
              if (match != null) {
                return MaterialPageRoute<void>(
                  builder: (context) => path.builder(context, match),
                  settings: settings,
                );
              }
            }
          }
        }
        return null;
      },
    );
  }

  static List<UrlPath> paths = [
    UrlPath(
      r'^\/item\/([\w-]+)$',
      (context, match) => ItemPage(id: match),
    ),
  ];
}
