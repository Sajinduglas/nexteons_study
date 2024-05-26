import 'package:flutter/material.dart';
import 'package:nexteons_study/global_widgets/place_holder_widget.dart';
import 'package:nexteons_study/global_widgets/responsive_builder.dart';
import 'package:nexteons_study/screen/dpi_rate_list/list/responsive/dpi_data_grid.dart';


class DpiRateView extends StatefulWidget {
  const DpiRateView({super.key});

  @override
  State<DpiRateView> createState() => _DpiRateViewState();
}

class _DpiRateViewState extends State<DpiRateView> {
  @override
  Widget build(BuildContext context) {
    return PlaceHolderWidget(
        child: ResponsiveBuilder(
            desktopScreen: DpiDataGrid(),
            tabScreen: DpiDataGrid(),
            mobileScreen: DpiDataGrid()));
  }
}
