import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/routes/my_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/student_data_model.dart';

RxList<Student> students = [
  Student(
      firstname: "sajin",
      lastname: "duglas",
      email: "sajin@gmail.com",
      id: 12,
      district: "kollam",
      phoneNumber: "8136855126",
      pincode: "691001",
      country: "india")
].obs;

void main() {
  setPathUrlStrategy();
  runApp(GetMaterialApp.router(
    routeInformationParser: router.routeInformationParser,
    routerDelegate: router.routerDelegate,
    routeInformationProvider: router.routeInformationProvider,
    debugShowCheckedModeBanner: false,
  ));
}
