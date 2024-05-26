import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


import '../../../global_widgets/main_frame_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/contstant/app_constants.dart';
import '../controller/main_frame_controller.dart';

class TabFrame extends StatelessWidget {
  final MainFrameController controller;
  const TabFrame({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 54, right: 34, left: 34),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/nexteon_image.png")),
            SizedBox(height: 15,),
            Obx(() => ListView.separated(
              itemCount: controller.buttonDetails.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => MainFrameButton(
                  color: Colors.white,
                  butttonName: controller.buttonDetails[index].name,
                  onpressed: () {
                    navigatorKey.currentContext!.goNamed(controller.buttonDetails[index].route);
                  }
              ), separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 15,); },
            ))
          ],
        ),
      ),
    );
  }
}
