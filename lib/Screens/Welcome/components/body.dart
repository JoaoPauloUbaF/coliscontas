// ignore_for_file: prefer_const_constructors

import 'package:coliscontas/Screens/HomePage/home_page.dart';
import 'package:coliscontas/Screens/Login/login_screen.dart';
import 'package:coliscontas/Screens/SignUp/sign_up_screen.dart';
import 'package:coliscontas/Screens/Welcome/welcome_screen.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Altura e largura total da tela
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Coli Contas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'LibreBaskerville',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(
                "assets/icons/logo_coliseu.svg",
                height: 300,
                // width: 25,
              ),
            ),
            RoundedButton(
              text: 'Login',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HomePage();
                        } else {
                          return LoginScreen();
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'Criar Conta',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
