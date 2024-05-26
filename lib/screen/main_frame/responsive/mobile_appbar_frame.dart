import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../global_widgets/main_frame_button.dart';
import '../../../utils/colors.dart';
import '../controller/main_frame_controller.dart';

class MobileAppbarFrame extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppbarFrame({super.key, required this.controller});

  final MainFrameController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
       AppBar(
        backgroundColor: ColorTheme.lightBlue,
        title: Image.asset(
          "assets/images/nexteon_image.png",
          width: size.width * 0.4,
          height: size.height * 0.4,
        ),
      );


  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
