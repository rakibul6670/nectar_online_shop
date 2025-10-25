import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar_online_shop/core/constants/urls.dart';
import 'package:nectar_online_shop/data/api_services/api_response.dart';
import 'package:nectar_online_shop/data/api_services/api_services.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';
import 'package:nectar_online_shop/data/models/user_model.dart';

class LoginProvider extends ChangeNotifier {
  Logger logger = Logger();

  //----------------- Password visibility off on -----------
  bool isPasswordHide = true;

  //---------------------- formKey --------------
  final loginFormKey = GlobalKey<FormState>();

  //------------------ Login Controller ------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool inProgressIndicator = false;

  //============================ Login Method =======================
  Future<bool> login() async {
    if (loginFormKey.currentState!.validate()) {
      await loginUser();
      return true;
    } else {
      return false;
    }
  }

  //============================ Login User ==========================
  Future loginUser() async {
    inProgressIndicator = false;
    notifyListeners();

    Map<String, dynamic> requestBody = {};

    ApiResponse response = await ApiServices.postData(
      Urls.loginUrl,
      requestBody,
    );

    if (response.isSuccess && response.statusCode == 201) {
      final token = response.responseBody["token"];

      UserModel model = UserModel.fromJson(
        response.responseBody["data"]["user"],
      );
      AuthStorage.saveUserData(token, model);

      inProgressIndicator = false;
      notifyListeners();
      logger.i(response.message);
    } else {
      logger.i(response.message);
    }
  }

  //========================= Password Visibility ====================
  void isPasswordVisibility() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }

  //==================== Dispose all field ===========================
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
