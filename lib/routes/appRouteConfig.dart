// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../screens/home.dart';
// import '../screens/signinScreen.dart';
// import '../screens/signupScreen.dart';
// import '../screens/welcomeScreen.dart';
// import './appRouteConstants.dart';
// import '../screens/errorPage.dart';

// class MyAppRoute {
//   final GoRouter router = GoRouter(
//     initialLocation: '/welcome',
//     routes: [
//       GoRoute(
//         name: MyAppRouteConstants.welcomePageRoute,
//         path: '/welcome',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: WelcomeScreen());
//         },
//       ),
//       GoRoute(
//         name: MyAppRouteConstants.signupPageRoute,
//         path: '/signup',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SignUpPAge());
//         },
//       ),
//       GoRoute(
//         name: MyAppRouteConstants.signinPageRoute,
//         path: '/signIn',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: SignInScreen());
//         },
//       ),
//       GoRoute(
//         name: MyAppRouteConstants.homePageRoute,
//         path: '/home',
//         pageBuilder: (context, state) {
//           return const MaterialPage(child: HomePage());
//         },
//       ),
//     ],
//     errorPageBuilder: (context, state) =>
//         const MaterialPage(child: ErrorPage()),
//   );
// }
