import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimaryColor,

  scaffoldBackgroundColor: AppColors.white,
  
  //==================== Text Button Theme =====================
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.lightPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19)
      )
    )
  )
      
);