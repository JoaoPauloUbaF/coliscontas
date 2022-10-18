import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.subtitle,
    required this.title,
    required this.press,
  }) : super(key: key);

  final Icon icon;
  final String subtitle;
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.001),
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.15,
          child: Card(
            color: Colors.black26,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: icon,
                  title: Text(
                    title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
