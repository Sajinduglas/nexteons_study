import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_study/global_widgets/TextField.dart';
import 'package:nexteons_study/global_widgets/save_&_proceed_button.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';
import '../controller/student_controller.dart';

class MobileScreen extends StatelessWidget {
  final StudentController controller;
  MobileScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: controller.validKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     Text(
                      "Basic details",
                      style:
                      GlTextStyles.interStyl(size: 14, weight: FontWeight.w700),
                    ),
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
                      },
                      fontSize: 12,
                  ),
                  TextFieldWidget(
                    title: "Last Name",
                    controller: controller.lastnameControl,
                    fontSize: 12,),
                  TextFieldWidget(
                    title: "Email Address",
                    controller: controller.mailController,
                    fontSize: 12,

                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return null;
                      } else if (!email.contains('@') || !email.contains('.com')) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    title: "User ID",
                    controller: controller.useridController,
                    fontSize: 12,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "id is required";
                      }
                    },
                  ),
                  TextFieldWidget(
                    title: "District",
                    controller: controller.districtController,
                    fontSize: 12,),
                  TextFieldWidget(
                    title: "Phone No.",
                    controller:controller.phoneNumberController,
                    fontSize: 12),
                  TextFieldWidget(
                    title: "Pincode",
                    controller: controller.pinCodeController,
                    fontSize: 12,

                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyBoardType: TextInputType.number,
                  ),
                  TextFieldWidget(
                    title: "Country",
                    controller: controller.countryController,
                    fontSize: 12),
                  Center(
                    child: SaveButtonWidget(
                      onPressed:
                       controller.createStudent,
                       fontSize: 10, buttonText: 'Save',),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: controller.resetAll,
                      child: Text(
                        "RESET ALL",
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
