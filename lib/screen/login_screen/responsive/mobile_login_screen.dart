import 'package:flutter/material.dart';


import '../../../global_widgets/TextField.dart';
import '../../../global_widgets/save_&_proceed_button.dart';
import '../../../utils/colors.dart';
import '../controller/login_screen_controlller.dart';



class MobileLoginScreen extends StatelessWidget {
  // final LoginScreenController controller = Get.put(LoginScreenController());
  final LoginScreenController controller;
   MobileLoginScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.validKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.7,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/login_animation.jpeg"))),
                  ),
                ),
                Text(
                  "welcome back!",
                  style: TextStyle(
                      fontSize: size.width * 0.050, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login your account",
                  style: TextStyle(
                      fontSize: size.width * 0.030, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                TextFieldWidget(
                  title: "username or Email",
                  fontSize: size.width * 0.030,
                  controller: controller.nameOrEmailController,
                  validator: (name){
                    if(name!.isEmpty){
                      return "This field is required";
                    }else if(name.length<6||!name.contains('@') ){
                      return "Enter a valid Email or name";
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  title: "Password",
                  fontSize: size.width * 0.030,
                  controller: controller.passwordController,
                    validator:  (password){
                      if (password == null || password.isEmpty) {
                        return "This field is required";
                      } else if (password.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    }
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
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
                    height: size.width * 0.050,
                    width: size.width * 0.4,
                    child: SaveButtonWidget(
                      fontSize: size.width * 0.030,
                      buttonText: "Login",
                      buttonColor: ColorTheme.blue,
                      onPressed:
                        controller.login
                      ,
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
