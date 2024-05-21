import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TabFrame extends StatelessWidget {
  const TabFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 200,
      color: ColorTheme.lightBlue,
      padding: const EdgeInsets.only(top: 54, right: 34, left: 34),
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/nexteon_image.png")),
    );
  }
}
