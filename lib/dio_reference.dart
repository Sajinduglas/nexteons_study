import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class LoginScreenController extends GetxController {
  final nameOrEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final validKey = GlobalKey<FormState>();

  final Dio _dio = Dio();

  Future<void> login(BuildContext context) async {
    if (validKey.currentState!.validate()) {
      final loginData = {
        "loginData": {
          "_deviceType": "",
          "_email": nameOrEmailController.text,
          "_password": passwordController.text,
          "_userType": 0,
          "deviceId": "",
          "deviceName": "test",
          "deviceToken": "test",
          "grant_type": "login"
        }
      };

      final data = {
        'query': loginMutation,
        'variables': loginData
      };

      try {
        final response = await _dio.post(
          'https://yourgraphqlapi.com/graphql', // replace with your GraphQL endpoint
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          final accessToken = response.data['data']['Auth_Login']['accessToken'];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login successful! Token: $accessToken'),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login failed!'),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: $e'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Validation failed!'),
      ));
    }
  }
}
