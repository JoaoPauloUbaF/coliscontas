import 'package:coliscontas/database/auth/auth_service.dart';
import 'package:coliscontas/providers/provider.dart';
import 'package:coliscontas/screens/SignUp/sign_up_screen.dart';
import 'package:coliscontas/components/already_have_an_account_check.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/rounded_password_field.dart';
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
  final auth = AuthService();
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
                width: 100,
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
            RoundedButton(
                text: "Login",
                press: () {
                  getIt<AuthService>().signIn(
                      emailController.text, passwordController.text, context);
                }),
            AlreadyHaveAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            })
          ],
        )
      ]),
    );
  }
}
