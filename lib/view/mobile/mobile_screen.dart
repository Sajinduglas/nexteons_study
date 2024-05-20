import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_study/view/widget/TextField.dart';
import 'package:nexteons_study/view/widget/save_&_proceed_button.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

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
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.lightBlue,
        title: Image.asset(
          "assets/images/nexteon_image.png", width: size.width * 0.4,
          height: size.height * 0.4,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Flexible(
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
                  },
                  fontSize: 12,
              ),
              TextFieldWidget(
                title: "Last Name",
                controller: lastnameControl,
                fontSize: 12,),
              TextFieldWidget(
                title: "Email Address",
                controller: mailController,
                fontSize: 12,
                formKey: mailKey,
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
                controller: useridController,
                fontSize: 12,
                formKey: uidKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "id is required";
                  }
                },
              ),
              TextFieldWidget(
                title: "District",
                controller: districtController,
                fontSize: 12,),
              TextFieldWidget(
                title: "Phone No.",
                controller: phoneNumberController,
                fontSize: 12),
              TextFieldWidget(
                title: "Pincode",
                controller: pinCodeController,
                fontSize: 12,
                formKey: pinkey,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyBoardType: TextInputType.number,
              ),
              TextFieldWidget(
                title: "Country",
                controller: countryController,
                fontSize: 12),
              Center(
                child: SaveButtonWidget(
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
                  }, fontSize: 10,),
              ),
              Center(
                child: TextButton(
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
