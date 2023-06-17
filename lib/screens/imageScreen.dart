import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  final String avatarTag;

  ProfileScreen({required this.avatarTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kContentColorLightTheme,
      ),
      body: Center(
        child: Hero(
          tag: avatarTag,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/birke.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
