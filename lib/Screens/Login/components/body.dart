import 'package:coliscontas/Screens/SignUp/sign_up_screen.dart';
import 'package:coliscontas/components/already_have_an_account_check.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/rounded_password_field.dart';
import 'package:coliscontas/components/text_field_container.dart';
import 'package:coliscontas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              ),
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(text: "Login", press: () {}),
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
}
