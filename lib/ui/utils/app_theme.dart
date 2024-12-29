import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {

  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.gray,
    iconTheme: const IconThemeData(color: AppColors.primary,size: 60,),

    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.gray,size: 20),
      elevation: 0,
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.gray,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}