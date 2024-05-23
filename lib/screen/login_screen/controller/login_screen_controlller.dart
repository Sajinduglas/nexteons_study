import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nexteons_study/utils/contstant/app_config.dart';
import 'package:nexteons_study/utils/contstant/app_constants.dart';
import 'package:nexteons_study/utils/contstant/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../student/list/responsive/desktop_result_screen.dart';

class LoginScreenController extends GetxController {
  final nameOrEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final validKey = GlobalKey<FormState>();
  late SharedPreferences preferences;

  final Dio dio = Dio();

  Future<void> login() async {
    if (validKey.currentState!.validate()) {
      final query = """query Auth_Login(\$loginData: LoginInput!) {
        Auth_Login(loginData: \$loginData) {
          accessToken
        }
      }""";

      final loginData = {
        "loginData": {
          "_deviceType": 0,
          "_email": nameOrEmailController.text,
          "_password": passwordController.text,
          "_userType": 0,
          "deviceId": "",
          "deviceName": "test",
          "deviceToken": "test",
          "grant_type": "password"
        }
      };

      final data = {'query': query, 'variables': loginData};

      try {
        final response = await dio.post(
          AppConfig.url,
          // replace with your GraphQL endpoint
          data: data,
          options: Options(
            headers: {
              // 'Content-Type': 'application/json',
              'X-Tenant-Id': "RL0582"
            },
          ),
        );
        print("statuscode ${response.statusCode}"); //jgvjhj
        if (response.statusCode == 200) {
          print("I");
          var accessToken =
              response.data['data']['Auth_Login']['accessToken'].toString();
          print("saccess $accessToken"); //
          preferences = await SharedPreferences.getInstance();
          preferences.setString(AppConfig.accessToken, jsonEncode(accessToken));
          preferences.setBool(AppConfig.checkToken, true);

          ///encode cheyunnai string akaan

          // print("saccess $accessToken"); //
          // ScaffoldMessenger.of(loginNavigatorKey.currentContext!)
          //     .showSnackBar(SnackBar(
          //   content: Text('Login successful! Token: $accessToken'),
          // ));

          // Navigator.push( navigatorKey.currentContext!,
          //     MaterialPageRoute(builder: (context) => DesktopResultScreen()));
          navigatorKey.currentContext!.goNamed(RoutesName.studentList);
        } else {
          ScaffoldMessenger.of(navigatorKey.currentContext!)
              .showSnackBar(SnackBar(
            content: Text('Login failed!'),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(SnackBar(
          content: Text('Error: $e'),
        ));
      }
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(
        content: Text('Validation failed!'),
      ));
    }
  }
}
