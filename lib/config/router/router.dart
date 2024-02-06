import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen/home_screen.dart';
import '../../presentation/screens/splash_screen/splash_screen.dart';

import '../../presentation/screens/add_alert_screen/add_alert_screen.dart';

class Router {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add-alert',
        builder: (context, state) => const AddAlertScreen(),
      ),
      GoRoute(
        path: '/graph',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage<void>(child: SplashScreen());
    },
  );
}

Router goRouter = Router();
