import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';

import 'config/router/router.dart';
import 'presentation/blocs/blocs.dart';
import 'presentation/blocs/service_locator.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => getIt<StocksBloc>()),
        BlocProvider(create: (context) => getIt<AlertBloc>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Stock App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
      routerDelegate: goRouter.router.routerDelegate,
      routeInformationParser: goRouter.router.routeInformationParser,
      routeInformationProvider: goRouter.router.routeInformationProvider,
      builder: (_, child) => child!,
    );
  }
}
