import 'package:flutter/material.dart';

import 'package:nexteons_study/screen/login_screen/controller/login_screen_controlller.dart';

import '../../../global_widgets/TextField.dart';
import '../../../global_widgets/save_&_proceed_button.dart';
import '../../../utils/colors.dart';

class TabLoginScreen extends StatelessWidget {
  // final LoginScreenController controller = Get.put(LoginScreenController());
  final LoginScreenController controller;

  TabLoginScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.width * 0.5,
                  width: size.width * 0.4,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/login_animation.jpeg"),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180, bottom: 80),
                  child: Container(
                    height: size.width * 0.5,
                    width: size.width * 0.40,
                    // color: Colors.blue,
                    child: Form(
                      key: controller.validKey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "welcome back!",
                                    style: TextStyle(
                                        fontSize: size.width * 0.018,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                    text: "\nLogin your account",
                                    style: TextStyle(
                                        fontSize: size.width * 0.016,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                            TextFieldWidget(
                              title: "username or Email",
                              fontSize: size.width * 0.012,
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
                                fontSize: size.width * 0.012,
                                controller: controller.passwordController,
                                validator: (password) {
                                  if (password == null ||
                                      password.isEmpty) {
                                    return "This field is required";
                                  } else if (password.length < 6) {
                                    return "Password must be at least 6 characters long";
                                  }
                                  return null;
                                }),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18),
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
                                height: size.width * 0.035,
                                width: size.width * 0.28,
                                child: SaveButtonWidget(
                                  fontSize: size.width * 0.012,
                                  buttonText: "Login",
                                  buttonColor: ColorTheme.blue,
                                  onPressed: controller.login,
                                ),
                              ),
                            )
                          ],
                        ),
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
