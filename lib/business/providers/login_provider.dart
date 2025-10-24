import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  //----------------- Password visibility off on -----------
  bool isPasswordHide = true;

  //---------------------- formKey --------------
  final loginFormKey = GlobalKey<FormState>();

  //------------------ Login Controller ------------
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();


  //============================ Login Method =======================
  bool login() {
    if (loginFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  //========================= Password Visibility =====================
  void isPasswordVisibility() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }


  //==================== Dispose all field ==============
  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }
}