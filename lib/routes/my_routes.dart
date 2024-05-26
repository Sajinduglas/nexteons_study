import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:nexteons_study/global_widgets/place_holder_widget.dart';
import 'package:nexteons_study/utils/contstant/app_config.dart';
import 'package:nexteons_study/utils/contstant/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/dpi_rate_list/list/dpi_rate_view.dart';

import '../screen/login_screen/login_view.dart';
import '../screen/student/create/student_create_view.dart';
import '../screen/student/list/student_list_view.dart';

import '../utils/contstant/app_constants.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    if (await IsTokenStored() == false) {
      return "/login";
    } else {
      if (state.fullPath == "/login") {
        return "/studentlist";
      } else {
        print("state${state.fullPath}");
        print("state${state.uri}");
        return null;
      }
    }
  },
  initialLocation: "/login",
  routes: [
    GoRoute(
      name: RoutesName.login,
      path: '/login',
      builder: (context, state) => LoginView(),
    ),
    ShellRoute(
        builder: (context, state, child) => PlaceHolderWidget(child: child),
        routes: [
          GoRoute(
              name: RoutesName.studentList,
              path: '/studentlist',
              builder: (context, state) => const StudentList(),
              routes: [
                GoRoute(
                  name: RoutesName.createStudent,
                  path: 'createstudent',
                  builder: (context, state) => const CreateStudent(),
                ),
              ]),
          GoRoute(
            name: RoutesName.dpiRateList,
            path: '/dpiratelist',
            builder: (context, state) => const DpiRateView(),
          ),
        ])
  ],
);

Future<bool> IsTokenStored() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? accessToken = preferences.getString(AppConfig.accessToken);
  if (accessToken != null) {
    return true;
  } else {
    return false;
  }
}
