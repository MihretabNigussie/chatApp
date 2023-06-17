import 'package:flutter/material.dart';
// import 'package:welcome/routes/appRouteConfig.dart';
import 'package:welcome/screens/welcomeScreen.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Flutter Way',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      home: const WelcomeScreen(),
      // routeInformationParser: MyAppRoute().router.routeInformationParser,
      // routerDelegate: MyAppRoute().router.routerDelegate,
    );
  }
}
