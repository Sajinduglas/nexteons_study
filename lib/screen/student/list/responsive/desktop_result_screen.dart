import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study/utils/contstant/app_constants.dart';

import '../../../../main.dart';
import '../../../../global_widgets/student_card_widget.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/contstant/route_names.dart';
import '../../../../utils/text_styles.dart';
import '../../create/student_create_view.dart';


class DesktopResultScreen extends StatelessWidget {
  DesktopResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 120, top: 72),
        child: SizedBox(
          height: double.infinity,
          width: size.width * .5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New students",
                  style: GlTextStyles.interStyl(
                      size: size.height*0.045, weight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Obx(() =>  GridView.builder(
                    itemCount: students.length + 1,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: .9,
                        mainAxisExtent: 200,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (
                        BuildContext context,
                        int index,
                        ) {
                      return index == students.length
                          ? GestureDetector(
                        onTap: () {
                          //need to change
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             CreateStudent()));
                          GoRouter.of(navigatorKey.currentContext!).goNamed(RoutesName.createStudent);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: ColorTheme.darkGrey),
                                color: ColorTheme.darkGrey
                                    .withOpacity(.4),
                                borderRadius:
                                BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  size: size.height * .050,
                                ),
                                Text(
                                  "Add New Student",
                                  style: GlTextStyles.interStyl(
                                      size: size.height * 0.025,
                                      weight: FontWeight.w400),
                                )
                              ],
                            )),
                      )
                          : StudentCard(
                          firstname: students[index].firstname,
                          lastname: students[index].lastname,
                          mail: students[index].email,
                          id: students[index].id,
                          district: students[index].district,
                          phone: students[index].phoneNumber,
                          pincode:
                          students[index].pincode,
                          country:
                          students[index].country, fontSize: size.height*0.020,);
                    },
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
