import 'package:coliscontas/Screens/Login/login_screen.dart';
import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/rounded_input.dart';
import 'package:coliscontas/components/signout_button.dart';
import 'package:coliscontas/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
              child: const GFAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/52152762?s=96&v=4"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bem vindo,",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.1),
                  child: Text(
                    user.email!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'LibreBaskerville',
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SignOutButton(),
          ],
        )
      ]),
    );
  }
}
