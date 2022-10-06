import 'dart:developer';

import 'package:coliscontas/Screens/HomePage/home_page.dart';
import 'package:flutter/foundation.dart';

import 'package:coliscontas/Screens/SignUp/sign_up_screen.dart';
import 'package:coliscontas/components/already_have_an_account_check.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/rounded_password_field.dart';
import 'package:coliscontas/components/text_field_container.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.15),
              child: SvgPicture.asset(
                "assets/icons/coliseusemborda.svg",
                height: 275,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: RoundedInput(
                hintText: "E-mail",
                onChanged: (value) {},
                controller: emailController,
              ),
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: passwordController,
            ),
            RoundedButton(text: "Login", press: signIn),
            AlreadyHaveAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            })
          ],
        )
      ]),
    );
  }

  signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Usuário não encontrado"),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Senha incorreta"),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
