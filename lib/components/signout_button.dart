import 'dart:developer';

import 'package:coliscontas/Screens/Welcome/welcome_screen.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../Screens/Login/login_screen.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);
  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.02),
      child: GFIconButton(
        color: kPrimaryColor,
        onPressed: signOut,
        icon: Transform.scale(
          scaleX: -1,
          child: Icon(
            Icons.output_sharp,
          ),
        ),
      ),
    );
  }

  signOut() {
    debugPrint("message");
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WelcomeScreen();
        },
      ),
    );
  }
}
