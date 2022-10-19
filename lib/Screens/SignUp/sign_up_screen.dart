import 'package:coliscontas/Screens/SignUp/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: true, body: Body());
  }
}
