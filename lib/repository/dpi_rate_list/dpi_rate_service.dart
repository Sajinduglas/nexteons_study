import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nexteons_study/utils/contstant/app_config.dart';

class DpiRateService{
  static Future<dynamic> fetchData(
      {required Map<String, dynamic> header,
        required Map<String, dynamic> data}) async {

    try {
      var response = await Dio().post(
        AppConfig.url,
        options: Options(headers: header),
        data: data,
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        var decodedData = response.data;
        print("Fetch Data Response: ${response.data}");
        return decodedData;
      } else {
        log("Else Condition -> Api failed->${response.statusCode}");
        return response.data;
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}