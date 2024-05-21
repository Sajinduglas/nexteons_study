import 'package:go_router/go_router.dart';

import '../screen/student/create/view.dart';
import '../screen/student/list/responsive/view.dart';
import '../utils/contstant/app_constants.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
initialLocation: "/createstudent",
  routes: [
    GoRoute(
      path: '/createstudent',
      builder: (context, state) => const CreateStudent(),
    ),
    GoRoute(
      path: '/studentlist',
      builder: (context, state) => const StudentList(),
    ),
  ],
);