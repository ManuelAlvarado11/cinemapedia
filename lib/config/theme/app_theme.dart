import 'package:flutter/material.dart';
import 'package:cinemapedia/config/theme/app_colors.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primary,
          primary: AppColors.grey,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'MuseoSans',
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            fontFamily: 'MuseoSans',
            fontWeight: FontWeight.w500,
          ),
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      );
}
