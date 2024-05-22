import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../global_widgets/student_card_widget.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/contstant/app_constants.dart';
import '../../../../utils/contstant/route_names.dart';
import '../../../../utils/text_styles.dart';
import '../../create/view.dart';


class TabResultScreen extends StatelessWidget {
  TabResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 100, top: 56),
        child: SizedBox(
          height: double.infinity,
          width: size.width * .5,
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New students",
                  style: GlTextStyles.interStyl(
                      size: 25, weight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Flexible(
                      child: Obx(() =>  GridView.builder(
                        itemCount: students.length + 1,
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 4,
                            mainAxisExtent: 175,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 7),
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
                                    horizontal: 25, vertical: 17),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: ColorTheme.darkGrey),
                                    color: ColorTheme.darkGrey
                                        .withOpacity(.3),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline,
                                      size: size.width * .035,
                                    ),
                                    Text(
                                      "Add New Student",
                                      style: GlTextStyles.interStyl(
                                          size: size.height*0.012,
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
                              students[index].country, fontSize: size.height*0.012,);
                        },
                      ),)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
