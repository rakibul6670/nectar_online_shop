import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:nectar_online_shop/data/api_services/api_response.dart';
import 'package:nectar_online_shop/data/get_storage/auth_storage.dart';

class ApiServices {

  static Logger logger = Logger();

  //============================ Get Data =====================================
  // Future getData(Uri url) async {
  //   try {
  //     //-------------- request sent to server -----------
  //     final response = await http.get(url);
  //
  //     //---------- response check ---------
  //     if (response.statusCode == 200) {
  //     } else {}
  //   } catch (e) {}
  // }

  //============================ Post Data =====================================
  static Future<ApiResponse> postData(
    Uri url,
    Map<String, dynamic> requestBody,
  ) async {
    try {
      final token = AuthStorage.accessToken;

      //--------------- logger request url check ----------
      loggerRequest(url);

      //-------------- request sent to server -----------
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", "token": token ?? " "},

        body: jsonEncode(requestBody),
      );

      //--------------- logger response ----------
      loggerResponse(url,response.body,response.statusCode);


    //---------- response check ---------
      if (response.statusCode == 201 || response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        return ApiResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedData,
          message: decodedData["message"],
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseBody: null,
        );
      }
    } catch (e) {
      return ApiResponse(
        statusCode: -1,
        isSuccess: false,
        responseBody: null,
        message: e.toString(),
      );
    }
  }


  //==================== logger request ===============
 static loggerRequest(url){
   return logger.i("Request url: $url");
 }
  //==================== logger response===============
  static loggerResponse(url,body,statusCode){
    return logger.i("Response url: $url \n Response body : $body \n Response status code : $statusCode");
  }


}
