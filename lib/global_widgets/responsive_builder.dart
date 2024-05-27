import 'package:flutter/material.dart';

import '../utils/check_size.dart';

class ResponsiveBuilder extends StatelessWidget {
  ResponsiveBuilder({super.key, required this.desktopScreen, required this.tabScreen, required this.mobileScreen});

  final Widget desktopScreen;
  final Widget tabScreen;
  final Widget mobileScreen;

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        if (fnCheckDesktop(size.width)) {
          return desktopScreen;
        } else if (fnCheckTab(size.width)) {
          return tabScreen;
        }else{
          return mobileScreen;
        }

      },
    );
  }}