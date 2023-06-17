import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../routes/appRouteConstants.dart';

Row SignUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Don\'t have an account',
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      TextButton(
        onPressed: () {
          // GoRouter.of(context).pushNamed(
          //                             MyAppRouteConstants.signupPageRoute);
        },
        child: const Text(
          'Sign up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}