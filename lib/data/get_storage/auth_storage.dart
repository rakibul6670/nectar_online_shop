import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:nectar_online_shop/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthStorage {
  static final String _userTokeyKey = "userTokenKey";
  static final String _userModelKey = "userModelKey";

  static String? accessToken;
  static UserModel? accessModel;

  //=========================== User Data Save ================================
  static Future saveUserData(String token, UserModel model) async {
    GetStorage store = GetStorage();
    //---------------- store in local storage -------
    await store.write(_userTokeyKey, token);
    await store.write(_userModelKey, jsonEncode(model.toJson()));

    //--------------- local variable value set -------
    accessToken = token;
    accessModel = model;
    Logger logger = Logger();
    logger.i("User data save successful");
    logger.i("User token: ${store.read(_userTokeyKey)}");
    logger.i("User user model : ${store.read(_userModelKey)}");
  }

  //=========================== Get Data Save ================================
  static void getUserData() {
    GetStorage store = GetStorage();
    //---------------- store in local storage -------
    String? token = store.read(_userTokeyKey);
    String? userModel = store.read(_userModelKey);

    if (token != null) {
      accessToken = token;
      if (userModel != null) {
        accessModel = UserModel.fromJson(jsonDecode(userModel));
      }
    }
  }
}
