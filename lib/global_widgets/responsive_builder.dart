import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  ResponsiveBuilder({super.key, required this.desktopScreen, required this.tabScreen, required this.mobileScreen});

  final Widget desktopScreen;
  final Widget tabScreen;
  final Widget mobileScreen;

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        if (size> 1024) {
          return desktopScreen;
        } else if (size > 650 && size < 1024) {
          return tabScreen;
        }else{
          return mobileScreen;
        }

      },
    );
  }}