import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study/global_widgets/place_holder_widget.dart';
import 'package:nexteons_study/screen/student/create/controller/student_controller.dart';
import 'package:nexteons_study/screen/student/create/responsive/Desktop_screen.dart';
import 'package:nexteons_study/screen/student/create/responsive/mobile_screen.dart';
import 'package:nexteons_study/screen/student/create/responsive/tab_screen.dart';
import 'package:nexteons_study/global_widgets/responsive_builder.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({super.key});

  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  late StudentController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(StudentController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<StudentController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        desktopScreen: DesktopScreen(
          controller: controller,
        ),
        tabScreen: TabScreen(
          controller: controller,
        ),
        mobileScreen: MobileScreen(
          controller: controller,
        ));
  }
}
