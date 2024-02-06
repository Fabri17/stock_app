import 'package:flutter/material.dart';
import 'core/constants/colors.dart';

import 'config/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Stock App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primary),
        useMaterial3: true,
      ),
      routerDelegate: goRouter.router.routerDelegate,
      routeInformationParser: goRouter.router.routeInformationParser,
      routeInformationProvider: goRouter.router.routeInformationProvider,
      builder: (_, child) => child!,
    );
  }
}
