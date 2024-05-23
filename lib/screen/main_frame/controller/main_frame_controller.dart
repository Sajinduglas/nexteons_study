import 'package:get/get.dart';
import 'package:nexteons_study/utils/contstant/route_names.dart';

import '../../../model/main_frame_model.dart';

class MainFrameController extends GetxController{
  RxList<MainFrameModel> buttonDetails=[
    MainFrameModel(name: "create student", route:  RoutesName.createStudent),
  MainFrameModel(name: "student list", route: RoutesName.studentList)
  ].obs;
}