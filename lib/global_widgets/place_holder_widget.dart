import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nexteons_study/screen/main_frame/controller/main_frame_controller.dart';

import 'package:nexteons_study/screen/main_frame/responsive/desktop_frame.dart';
import 'package:nexteons_study/screen/main_frame/responsive/mobile_appbar_frame.dart';
import 'package:nexteons_study/screen/main_frame/responsive/tab_frame.dart';
import 'package:nexteons_study/utils/check_size.dart';

import '../shell_route_reference.dart';
import '../utils/contstant/app_constants.dart';
import 'main_frame_button.dart';

class PlaceHolderWidget extends StatefulWidget {
  const PlaceHolderWidget({super.key, required this.child});

  final Widget child;

  @override
  State<PlaceHolderWidget> createState() => _PlaceHolderWidgetState();
}

class _PlaceHolderWidgetState extends State<PlaceHolderWidget> {
  late MainFrameController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(MainFrameController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MainFrameController>(
      tag: tag,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          appBar: fnCheckMobile(size.width)
              ? MobileAppbarFrame(
                  controller: controller,
                )
              : null,
          drawer: fnCheckMobile(size.width)
              ? Drawer(
                  child: ListView.builder(
                    itemCount: controller.buttonDetails.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MainFrameButton(
                        color: Colors.white,
                        butttonName: controller.buttonDetails[index].name,
                        onpressed: () {
                          navigatorKey.currentContext!
                              .goNamed(controller.buttonDetails[index].route);
                        }),
                  ),
                )
              : null,
          body: Row(
            children: [
              if (fnCheckDesktop(size.width))
                DesktopFrame(
                  controller: controller,
                ),
              if (fnCheckTab(size.width))
                TabFrame(
                  controller: controller,
                ),
              Expanded(child: widget.child)
            ],
          ));
    });
    // return
  }
}
