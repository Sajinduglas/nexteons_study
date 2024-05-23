import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/global_widgets/responsive_builder.dart';
import 'package:nexteons_study/screen/login_screen/controller/login_screen_controlller.dart';
import 'package:nexteons_study/screen/login_screen/responsive/desktop_login_screen.dart';
import 'package:nexteons_study/screen/login_screen/responsive/mobile_login_screen.dart';
import 'package:nexteons_study/screen/login_screen/responsive/tab_login_screen.dart';
class LoginView extends StatefulWidget {
   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginScreenController controller;
  final String tag= DateTime.now().toString();
  @override
  void initState() {
    controller= Get.put(LoginScreenController(),tag: tag);
    super.initState();
  }
  @override
  void dispose() {
  Get.delete<LoginScreenController>(tag: tag);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(desktopScreen: DesktopLoginScreen(controller: controller,),
        tabScreen: TabLoginScreen(controller: controller,),
        mobileScreen: MobileLoginScreen(controller: controller,));
  }
}
