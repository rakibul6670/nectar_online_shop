import 'package:flutter/material.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';

class SplashProvider extends ChangeNotifier {

  Future<void> nextScreen(
    VoidCallback onLoginTrue,
   VoidCallback onLoginFalse,
  ) async {
    Future.delayed(Duration(seconds: 2), () {
      final isLogged = AuthStorage.isLogin();

      if (isLogged) {
        onLoginTrue();

      } else {
        onLoginFalse();
      }
    });
  }
}
