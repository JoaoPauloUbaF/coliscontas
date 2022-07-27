import 'package:coliscontas/Screens/Welcome/components/background.dart';
import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/constants.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Coli Contas",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/icons/Logo-Coliseu-Vetorizada.svg",
                height: size.height * 0.4,
              ),
            ),
            RoundedButton(
              text: 'Login',
              press: () => {},
            ),
            RoundedButton(
              text: 'Sign Up',
              press: () => {},
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
