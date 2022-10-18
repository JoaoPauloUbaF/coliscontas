import 'package:coliscontas/components/text_field_container.dart';
import 'package:coliscontas/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none),
    ));
  }
}
