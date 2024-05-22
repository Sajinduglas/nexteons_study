import 'package:go_router/go_router.dart';
import 'package:nexteons_study/utils/contstant/route_names.dart';

import '../screen/student/create/view.dart';
import '../screen/student/list/responsive/view.dart';
import '../utils/contstant/app_constants.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
initialLocation: "/createstudent",
  routes: [
    GoRoute(
      name: RoutesName.createStudent,
      path: '/createstudent',
      builder: (context, state) => const CreateStudent(),
    ),
    GoRoute(
      name: RoutesName.studentList,
      path: '/studentlist',
      builder: (context, state) => const StudentList(),
    ),
  ],
);