import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:welcome/screens/signinScreen.dart';
import 'package:welcome/utils/colorUtils.dart';
// import '../routes/appRouteConstants.dart';
import '../../components/textFormField.dart';
import '../components/reusableBtn.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor('CB2B93'),
            hexStringToColor('9546C4'),
            hexStringToColor('5E61F4')
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, screenHeight * 0.2, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFields(
                  text: 'Enter User name',
                  icon: Icons.person_outlined,
                  isPasswordType: false,
                  controller: _userNameController
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFields(
                  text: 'Enter Email',
                  icon: Icons.email_outlined,
                  isPasswordType: false,
                  controller: _emailTextController
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFields(
                  text: 'Enter Password',
                  icon: Icons.lock_outline,
                  isPasswordType: true,
                  controller: _passwordTextController
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableBtn(context, false, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SignInScreen()));
                  // GoRouter.of(context)
                  //     .pushNamed(MyAppRouteConstants.signinPageRoute);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}