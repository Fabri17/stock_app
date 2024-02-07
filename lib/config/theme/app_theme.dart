import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

const seedColor = CustomColors.primary;

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: isDarkmode
                ? MaterialStateProperty.all(seedColor.withAlpha(400))
                : MaterialStateProperty.all(seedColor),
            foregroundColor: MaterialStateProperty.all(CustomColors.white),
          ),
        ),
      );
}
