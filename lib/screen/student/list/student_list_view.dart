import 'package:flutter/material.dart';
import 'package:nexteons_study/global_widgets/place_holder_widget.dart';
import 'package:nexteons_study/screen/student/list/responsive/tab_result%20screen.dart';
import 'package:nexteons_study/global_widgets/responsive_builder.dart';

import 'responsive/desktop_result_screen.dart';
import 'responsive/mobilleResultScreen.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        desktopScreen: DesktopResultScreen(),
        tabScreen: TabResultScreen(),
        mobileScreen: MobileResultScreen());
  }
}
