import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DesktopFrame extends StatelessWidget {
  const DesktopFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 375,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/nexteon_image.png")),
    );
  }
}
