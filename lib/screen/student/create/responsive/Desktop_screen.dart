import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/screen/student/create/controller/student_controller.dart';
import 'package:nexteons_study/global_widgets/TextField.dart';
import 'package:nexteons_study/global_widgets/save_&_proceed_button.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';
import '../../list/responsive/desktop_result_screen.dart';

class DesktopScreen extends StatelessWidget {

  final StudentController controller;
  DesktopScreen({super.key, required this.controller});



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.validKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 120, top: 72),
          child: SizedBox(
            height: double.infinity,
            width: size.width * .5,
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BASIC DETAILS",
                    style: GlTextStyles.interStyl(
                        size: 35, weight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 16,
                              mainAxisExtent: 115,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 50),
                      children: [
                        TextFieldWidget(
                          title: "First Name",
                          controller: controller.firstnameController,

                          validator: (firstname) {
                            if (firstname!.isEmpty) {
                              return "This field is required";
                            } else if (firstname.length < 4) {
                              return "Atleast 3 characters required";
                            } else {
                              return null;
                            }
                          }, fontSize: size.height*0.02,
                        ),
                        TextFieldWidget(
                            title: "Last Name",
                            controller: controller.lastnameControl,  fontSize: size.height*0.02,),
                        TextFieldWidget(
                          title: "Email Address",
                          controller: controller.mailController,
                          fontSize: size.height*0.02,

                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return null;
                            } else if (!email.contains('@') ||
                                !email.contains('.com')) {
                              return 'Enter a valid Email';
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          title: "User ID",
                          controller: controller.useridController,
                          fontSize: size.height*0.02,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "id is required";
                            }
                          },
                        ),
                        TextFieldWidget(
                            title: "District", controller: controller.districtController,fontSize: size.height*0.02,),
                        TextFieldWidget(
                            title: "Phone No.", controller: controller.phoneNumberController,fontSize: size.height*0.02,),
                        TextFieldWidget(
                          title: "Pincode",
                          controller: controller.pinCodeController,
                          fontSize: size.height*0.02,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyBoardType: TextInputType.number,
                        ),
                        TextFieldWidget(
                            title: "Country", controller: controller.countryController,fontSize: size.height*0.02,),
                      ],
                    ),
                  ),
                const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed:
                         controller.resetAll,
                        child: Text(
                          "RESET ALL",
                        ),
                      ),
                      SizedBox(width: size.width*0.04,),
                      SaveButtonWidget(
                        onPressed: controller.createStudent, fontSize: 20,)

                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
