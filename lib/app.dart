import 'package:flutter/material.dart';
import 'package:nectar_online_shop/business/providers/login_provider.dart';
import 'package:nectar_online_shop/business/providers/product_provider.dart';
import 'package:nectar_online_shop/core/theme/app_theme.dart';
import 'package:nectar_online_shop/presentation/screens/main_nav_bar_holder_screen.dart';
import 'package:nectar_online_shop/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'business/providers/signup_provider.dart';

class NectarOnlineShop extends StatelessWidget {
  const NectarOnlineShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_)=> ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: MainNavBarHolderScreen(),

        theme: AppTheme.light,
      ),
    );
  }
}
