import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_study/view/widget/TextField.dart';
import 'package:nexteons_study/view/widget/save_&_proceed_button.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class DesktopScreen extends StatelessWidget {
  DesktopScreen({super.key});

  final firstnameController = TextEditingController();
  final mailController = TextEditingController();
  final lastnameControl = TextEditingController();
  final useridController = TextEditingController();
  final districtController = TextEditingController();
  final pinCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final firstNameKey = GlobalKey<FormState>();
  final mailKey = GlobalKey<FormState>();
  final pinkey = GlobalKey<FormState>();
  final uidKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 350,
              color: ColorTheme.lightBlue,
              padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/nexteon_image.png")),
            ),
            Padding(
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
                        child: Flexible(
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
                                controller: firstnameController,
                                formKey: firstNameKey,
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
                                  controller: lastnameControl,  fontSize: size.height*0.02,),
                              TextFieldWidget(
                                title: "Email Address",
                                controller: mailController,
                                fontSize: size.height*0.02,
                                formKey: mailKey,
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
                                controller: useridController,
                                fontSize: size.height*0.02,
                                formKey: uidKey,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "id is required";
                                  }
                                },
                              ),
                              TextFieldWidget(
                                  title: "District", controller: districtController,fontSize: size.height*0.02,),
                              TextFieldWidget(
                                  title: "Phone No.", controller: phoneNumberController,fontSize: size.height*0.02,),
                              TextFieldWidget(
                                title: "Pincode",
                                controller: pinCodeController,
                                formKey: pinkey,
                                fontSize: size.height*0.02,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyBoardType: TextInputType.number,
                              ),
                              TextFieldWidget(
                                  title: "Country", controller: countryController,fontSize: size.height*0.02,),
                            ],
                          ),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              firstnameController.clear();
                              lastnameControl.clear();
                              useridController.clear();
                              mailController.clear();
                              phoneNumberController.clear();
                              countryController.clear();
                              pinCodeController.clear();
                              districtController.clear();
                            },
                            child: Text(
                              "RESET ALL",
                            ),
                          ),
                          SizedBox(width: size.width*0.04,),
                          SaveButtonWidget(
                            onPressed: () {
                              if (firstNameKey.currentState!.validate() &&
                                  mailKey.currentState!.validate() &&
                                  uidKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Sucess")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Invalid input")));
                              }

                          }, fontSize: 20,)

                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
