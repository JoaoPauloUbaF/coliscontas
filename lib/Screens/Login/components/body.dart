import 'package:coliscontas/components/already_have_an_account_check.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/rounded_password_field.dart';
import 'package:coliscontas/components/text_field_container.dart';
import 'package:coliscontas/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LibreBaskerville',
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.01),
              child: Image.asset(
                'assets/images/logo_coliseu.png',
                height: size.height * 0.3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: RoundedInput(
                hintText: "E-mail",
                onChanged: (value) {},
              ),
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(text: "Login", press: () {}),
            AlreadyHaveAccountCheck(
              press: () {},
            )
          ],
        )
      ]),
    );
  }
}
