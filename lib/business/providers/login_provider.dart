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

  bool isLoginSuccess = true;

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
    inProgressIndicator = true;
    isLoginSuccess = false;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "email":emailController.text.trim(),
      "password":passwordController.text.trim(),
    };

    ApiResponse response = await ApiServices.postData(
      Urls.loginUrl,
      requestBody,
    );

    inProgressIndicator = false;
    notifyListeners();

    if (response.isSuccess && (response.statusCode == 201 || response.statusCode == 200)) {

      final token = response.responseBody["data"]["token"];
      //--------- user model e data save -------
      UserModel model = UserModel.fromJson(
        response.responseBody["data"]["user"],
      );

      //----------- Get storage e data save --------------
      await AuthStorage.saveUserData(token, model);

       AuthStorage.isLogin();


      isLoginSuccess = true;
      notifyListeners();

      //------------ Clear all field -----------
      clearField();

    } else {
      logger.i(response.message);
    }
  }

  //========================= Password Visibility ====================
  void isPasswordVisibility() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }
  //==================== clear all field ===========================
  void clearField(){
    emailController.clear();
    passwordController.clear();
  }


  //==================== Dispose all field ===========================
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
