//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import 'package:nexteons_study/screen/student/list/responsive/desktop_result_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _router.routerDelegate,
//       routeInformationParser: _router.routeInformationParser,
//       routeInformationProvider: _router.routeInformationProvider,
//     );
//   }
// }
//
// GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//
// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   navigatorKey: navigatorKey,
//   routes: [
//     ShellRoute(
//
//       builder: (context, state, child) {
//         return Scaffold(
//           appBar: AppBar(title: Text('Sidebar Navigation Example')),
//           body: Row(
//             children: [
//               NavigationSidebar(),  // Sidebar with navigation buttons
//               Expanded(child: child),  // Main content area that displays the routed child
//             ],
//           ),
//         );
//       },
//       routes: [
//         GoRoute(
//           name: "yyy",
//           path: '/',
//           builder: (BuildContext context, GoRouterState state) {
//             return HomeScreen();
//           },
//
//         ),
//         GoRoute(
//           path: '/details',
//           builder: (BuildContext context, GoRouterState state) {
//             return DetailsScreen();
//           },
//           routes: [
//             GoRoute(
//               name: "uuuu",
//               path: 'pg',
//               builder: (context, state) {
//                 return DesktopResultScreen();
//               },
//               routes: []
//             ),
//           ],
//         ),
//         GoRoute(
//           path: '/profile',
//           builder: (BuildContext context, GoRouterState state) {
//             return ProfileScreen();
//           },
//         ),
//       ],
//     ),
//   ],
// );
//
// class NavigationSidebar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       color: Colors.grey[200],
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SidebarButton(
//             label: 'Home',
//             onPressed: () {
//               context.go('/');
//             },
//           ),
//           SidebarButton(
//             label: 'Details',
//             onPressed: () {
//               context.go('/details');
//             },
//           ),
//           SidebarButton(
//             label: 'Profile',
//             onPressed: () {
//               context.go('/profile');
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
// class SidebarButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;
//
//   const SidebarButton({required this.label, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(label),
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: Text('This is the home screen'),
//       ),
//     );
//   }
// }
//
// class DetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Details')),
//       body: Center(
//         child:
//         SidebarButton(
//           label: 'Desktop',
//           onPressed: () {
//             context.goNamed('uuuu');
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Center(
//         child: Text('This is the profile screen'),
//       ),
//     );
//   }
// }
//
// // class SamplScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Sample')),
// //       body: Center(
// //         child: Text('This is the sample screen'),
// //       ),
// //     );
// //   }
// // }
