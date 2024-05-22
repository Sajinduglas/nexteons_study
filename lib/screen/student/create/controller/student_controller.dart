import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study/screen/student/list/responsive/desktop_result_screen.dart';
import 'package:nexteons_study/utils/contstant/app_constants.dart';

import '../../../../main.dart';
import '../../../../model/student_data_model.dart';
import '../../../../utils/contstant/route_names.dart';
import '../../list/responsive/view.dart';

class StudentController extends GetxController {
  final firstnameController = TextEditingController();
  final mailController = TextEditingController();
  final lastnameControl = TextEditingController();
  final useridController = TextEditingController();
  final districtController = TextEditingController();
  final pinCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();

  final validKey = GlobalKey<FormState>();


  // void addStudent(BuildContext context,
  //     {required String fname,
  //       required String lname,
  //       required String mail,
  //       required int id,
  //       required String dist,
  //       required String phone,
  //       required int pin,
  //       required String country}) {
  //   students.add(Student(
  //       firstname: fname,
  //       lastname: lname,
  //       email: mail,
  //       id: id,
  //       district: dist,
  //       phoneNumber: phone,
  //       pincode: pin,
  //       country: country));
  // }
  void resetAll() {
    firstnameController.clear();
    lastnameControl.clear();
    useridController.clear();
    mailController.clear();
    phoneNumberController.clear();
    countryController.clear();
    pinCodeController.clear();
    districtController.clear();
  }

  void createStudent() {
    if (validKey.currentState!.validate()) {
      //succsess
      students.add(Student(
          firstname: firstnameController.text,
          lastname: lastnameControl.text,
          email: mailController.text,
          id: int.parse(useridController.text),
          district: districtController.text,
          phoneNumber: phoneNumberController.text,
          pincode:pinCodeController.text,
          country: countryController.text));

      //need to change here
      // Navigator.push(navigatorKey.currentState!.context,
      //     MaterialPageRoute(builder: (Context) => StudentList()));
      // GoRouter.of(navigatorKey.currentContext!).go(RoutesName.studentList);
    navigatorKey.currentContext!.goNamed(RoutesName.studentList);
      firstnameController.clear();
      lastnameControl.clear();
      useridController.clear();
      mailController.clear();
      phoneNumberController.clear();
      countryController.clear();
      pinCodeController.clear();
      districtController.clear();
      // Get.to( DesktopResultScreen());
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text("Invalid input",),));
    }
  }
}
