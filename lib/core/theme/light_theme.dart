import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimaryColor,

  scaffoldBackgroundColor: AppColors.white,

  //====================== Text Theme ======================
  textTheme: TextTheme(
    //-------------- headline ----------
    headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),

    //----------------- title ----------
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xffE2E2E2),
    ),

    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xff7C7C7C),
    ),

    //--------------------- Body Text -----------
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xff181725),
    ),
  ),

  //==================== Text Button Theme =================
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.lightPrimaryColor,
      foregroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
    ),
  ),

  //=================== Text Form Field ====================
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      //color: Color(0xff181725),
      color: Colors.grey
    ),

    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffE2E2E2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff000000)),
    ),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
  ),




);
