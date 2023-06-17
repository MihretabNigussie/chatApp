import '../utils/colorUtils.dart';
import 'package:flutter/material.dart';
import '../../components/textFormField.dart';
import '../../components/signUpOption.dart';
import '../components/reusableBtn.dart';

// import 'package:go_router/go_router.dart';
// import '../routes/appRouteConstants.dart';
import 'home.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor('CB2B93'),
            hexStringToColor('9546C4'),
            hexStringToColor('5E61F4')
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              20, screenHeight * 0.2, 20, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign in',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFields(
                  text: 'Enter User name',
                  icon: Icons.person_outlined,
                  isPasswordType: false,
                  controller: _userNameController),
              const SizedBox(
                height: 20,
              ),
              TextFields(
                  text: 'Enter Password',
                  icon: Icons.lock_outline,
                  isPasswordType: true,
                  controller: _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              reusableBtn(context, true, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                // GoRouter.of(context).pushNamed(
                // MyAppRouteConstants.homePageRoute);
              }),
              SignUpOption(context),
            ],
          ),
        ),
      ),
    );
  }
}