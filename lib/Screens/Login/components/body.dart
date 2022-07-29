import 'package:coliscontas/Screens/Login/components/background.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "LogIn",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'LibreBaskerville',
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo_coliseu.png',
              height: size.height * 0.4,
            ),
          ),
          RoundedInput(
            hintText: "E-mail",
            onChanged: (value) {},
          ),
          RoundedInput(
            hintText: "Senha",
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
