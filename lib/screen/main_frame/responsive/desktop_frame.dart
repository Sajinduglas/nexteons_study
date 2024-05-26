import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study/global_widgets/main_frame_button.dart';
import 'package:nexteons_study/screen/main_frame/controller/main_frame_controller.dart';


import '../../../utils/colors.dart';
import '../../../utils/contstant/app_constants.dart';
import '../../../utils/contstant/route_names.dart';

class DesktopFrame extends StatelessWidget {
  const DesktopFrame({super.key, required this.controller});

  final MainFrameController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 375,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/nexteon_image.png")),
            SizedBox(
              height: 20,
            ),
            Obx(() => ListView.separated(
                  itemCount: controller.buttonDetails.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => MainFrameButton(
                      color: Colors.white,
                      butttonName: controller.buttonDetails[index].name,
                      onpressed: () {
                        navigatorKey.currentContext!.goNamed(controller.buttonDetails[index].route);
                      }), separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 15,); },
                ))
          ],
        ),
      ),
    );
  }
}
