import 'dart:io';

import 'package:coliscontas/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor, borderColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.borderColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: kIsWeb ? size.width * 0.2 : size.width * 0.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: TextButton(
              onPressed: () => press(),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: color,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
              child: Text(text, style: TextStyle(color: textColor))),
        ),
      ),
    );
  }
}
