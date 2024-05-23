import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nexteons_study/global_widgets/TextField.dart';
import 'package:nexteons_study/screen/login_screen/controller/login_screen_controlller.dart';

import 'package:nexteons_study/utils/colors.dart';

import '../../../global_widgets/save_&_proceed_button.dart';

class DesktopLoginScreen extends StatelessWidget {
  // final LoginScreenController controller = Get.put(LoginScreenController());

  final LoginScreenController controller;

  DesktopLoginScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Expanded(
          child: Center(
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width * 0.5,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/login_animation.jpeg"))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 125),
                  child: Container(
                    height: size.width * 0.5,
                    width: size.width * 0.4,
                    // color: Colors.blue,
                    child: Form(
                      key: controller.validKey,
                      child: ListView(
                        children: [
                          Text(
                            "welcome back!",
                            style: TextStyle(
                                fontSize: size.width * 0.022,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Login your account",
                            style: TextStyle(
                                fontSize: size.width * 0.020,
                                fontWeight: FontWeight.bold),
                          ),
                          TextFieldWidget(
                            title: "username or Email",
                            fontSize: size.width * 0.015,
                            controller: controller.nameOrEmailController,
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "This field is required";
                              } else if (name.length < 6 ||
                                  !name.contains('@')) {
                                return "Enter a valid Email or name";
                              }
                              return null;
                            },
                          ),
                          TextFieldWidget(
                              title: "Password",
                              fontSize: size.width * 0.015,
                              controller: controller.passwordController,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return "This field is required";
                                } else if (password.length < 6) {
                                  return "Password must be at least 6 characters long";
                                }
                                return null;
                              }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ListTile(
                              trailing: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget password",
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: size.width * 0.040,
                              width: size.width * 0.4,
                              child: SaveButtonWidget(
                                fontSize: size.width * 0.015,
                                buttonText: "Login",
                                buttonColor: ColorTheme.blue,
                                onPressed:
                                  controller.login

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
