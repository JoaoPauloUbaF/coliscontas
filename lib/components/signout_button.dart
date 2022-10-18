import 'package:coliscontas/screens/Welcome/welcome_screen.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      child: IconButton(
        color: kPrimaryColor,
        onPressed: signOut,
        icon: Transform.scale(
          scaleX: -1,
          child: const Icon(
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
          return const WelcomeScreen();
        },
      ),
    );
  }
}
