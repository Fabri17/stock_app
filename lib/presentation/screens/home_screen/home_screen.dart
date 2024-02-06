import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/presentation/blocs/theme_cubit/theme_cubit.dart';

import 'widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: const [
            HomeHeader(),
            SizedBox(height: 24),
            StockWatchList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => themeCubit.toggleTheme(),
        child: Icon(
          themeCubit.state.isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
        ),
      ),
    );
  }
}
