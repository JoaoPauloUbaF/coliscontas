import 'package:coliscontas/database/auth_service.dart';
import 'package:coliscontas/screens/Login/login_screen.dart';
import 'package:coliscontas/components/already_have_an_account_check.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/rounded_password_field.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  AuthService auth = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: SvgPicture.asset(
                "assets/icons/logocoliseusemnome.svg",
                height: 225,
                width: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: RoundedInput(
                hintText: "Nome de usuário",
                onChanged: (value) {},
                controller: userNameController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
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
              text: "Criar Conta",
              press: () {
                auth.signUpEmailAndPassword(emailController.text,
                    passwordController.text, userNameController.text, context);
              },
            ),
            AlreadyHaveAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            const OrDivider(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    auth.signInWithGoogle();
                  },
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: kPrimaryColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              iconSrc,
              height: 30,
              // width: 25,
            ),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: kIsWeb ? size.width * 0.2 : size.width * 0.7,
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "Ou",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Color.fromARGB(255, 0, 0, 0),
        height: 1.5,
      ),
    );
  }
}
