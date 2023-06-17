import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:welcome/screens/signupScreen.dart';
// import '../routes/appRouteConstants.dart';
import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Image.asset('assets/logo.jpg'),
                  height: 150, // adjust the height here as needed
                ),
              ),
              const Spacer(flex: 3),
              Text(
                "Welcome to our 101nian \nmessaging app",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "let's talk with our beloved ones",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.64),
                ),
              ),
              const Spacer(flex: 3),
              FittedBox(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                      // GoRouter.of(context)
                      //     .pushNamed(MyAppRouteConstants.signupPageRoute);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.8),
                                  ),
                        ),
                        const SizedBox(width: kDefaultPadding / 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.8),
                        )
                      ],
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
