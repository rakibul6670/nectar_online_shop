import 'package:flutter/material.dart';
import 'package:nectar_online_shop/core/theme/app_theme.dart';
import 'package:nectar_online_shop/presentation/screens/splash_screen.dart';

class NectarOnlineShop extends StatelessWidget {
  const NectarOnlineShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: SplashScreen(),

      theme: AppTheme.light,


    );
  }
}
