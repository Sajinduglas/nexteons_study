import 'package:flutter/material.dart';

import 'package:nexteons_study/global_widgets/desktop_frame.dart';
import 'package:nexteons_study/global_widgets/mobile_appbar_frame.dart';
import 'package:nexteons_study/global_widgets/tab_frame.dart';
import 'package:nexteons_study/utils/check_size.dart';

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget({super.key, required this.child});
  final Widget child;


  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints){
      return Scaffold(
             appBar: fnCheckMobile(size.width)? MobileAppbarFrame() : null,
        body: Row(children: [
          if(fnCheckDesktop(size.width))
            DesktopFrame(),
          if(fnCheckTab(size.width))
            TabFrame(),
          Expanded(child: child)
        ],)
           );
    });
    // return
  }
}
