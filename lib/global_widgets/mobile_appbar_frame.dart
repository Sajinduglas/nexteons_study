import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MobileAppbarFrame extends StatelessWidget implements PreferredSizeWidget
{
  const MobileAppbarFrame({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
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
