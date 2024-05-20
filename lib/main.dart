import 'package:flutter/material.dart';
import 'package:nexteons_study/view/desktop/Desktop_screen.dart';
import 'package:nexteons_study/view/mobile/mobile_screen.dart';
import 'package:nexteons_study/view/tab/tab_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LayoutBuilderExample(),
  ));
}
class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

      if (constraints.maxWidth > 1024) {
        return DesktopScreen();
      } else if (constraints.maxWidth > 663 && constraints.maxWidth < 1024) {
        return TabScreen();
      }else{
        return MobileScreen();
      }

        },
      ),
    );
  }}