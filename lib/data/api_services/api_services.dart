import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nectar_online_shop/data/api_services/api_response.dart';

class ApiServices {

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
  static Future<ApiResponse> postData(Uri url,Map<String,dynamic> requestBody) async {
    try {
      //-------------- request sent to server -----------
      final response = await http.post(
        url,
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(requestBody),
      );

      //---------- response check ---------
      if (response.statusCode == 201 || response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        return ApiResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          response: decodedData,
          message: decodedData["message"],
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          response: null,
        );
      }
    } catch (e) {
      return ApiResponse(
          statusCode: -1,
          isSuccess: false,
          response: null,
        message: e.toString(),
      );
    }
  }

}
