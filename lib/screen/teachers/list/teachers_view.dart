import 'package:flutter/material.dart';
import 'package:nexteons_study/global_widgets/place_holder_widget.dart';
import 'package:nexteons_study/global_widgets/responsive_builder.dart';
import 'package:nexteons_study/screen/teachers/list/responsive/teachers_data_grid.dart';

class TeachersView extends StatefulWidget {
  const TeachersView({super.key});

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  @override
  Widget build(BuildContext context) {
    return PlaceHolderWidget(
        child: ResponsiveBuilder(
            desktopScreen: TeachersDataGrid(),
            tabScreen: TeachersDataGrid(),
            mobileScreen: TeachersDataGrid()));
  }
}
