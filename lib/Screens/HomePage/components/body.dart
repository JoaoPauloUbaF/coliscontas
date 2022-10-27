import 'package:coliscontas/components/background.dart';
import 'package:coliscontas/components/category_card.dart';
import 'package:coliscontas/components/signout_button.dart';
import 'package:coliscontas/helpers/loader.dart';
import 'package:coliscontas/models/user_model.dart';
import 'package:coliscontas/providers/provider.dart';
import 'package:coliscontas/screens/Bills/bills_page.dart';
import 'package:coliscontas/screens/Profile/user_profile.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with Loader {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: ListView(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const UserProfile();
                      },
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .07,
                  backgroundColor: Colors.grey[300],
                  foregroundImage: NetworkImage(getIt<UserModel>().picture),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bem vindo,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  getIt<UserModel>().name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SignOutButton(),
          ],
        ),
        Row(
          children: [
            CategoryCard(
              title: "Contas",
              subtitle: "Quem não paga não come",
              icon: const Icon(
                Icons.monetization_on,
                size: 40,
                color: Colors.green,
              ),
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const BillsPage();
                    },
                  ),
                );
              },
            ),
            CategoryCard(
              title: "Compras",
              subtitle: "Cadastra as compras ai irmão!",
              icon: const Icon(
                Icons.shopping_bag_sharp,
                size: 40,
                color: Colors.amber,
              ),
              press: () {
                debugPrint("clicou Compras");
              },
            ),
          ],
        ),
        Row(
          children: [
            CategoryCard(
              title: "Carne",
              subtitle: "Faz a boa",
              icon: Icon(
                Icons.food_bank_rounded,
                size: 40,
                color: Colors.red.shade300,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
            CategoryCard(
              title: "Caixinha",
              subtitle: "Vamos economizar",
              icon: Icon(
                Icons.savings_sharp,
                size: 40,
                color: Colors.orange.shade400,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
          ],
        ),
        Row(
          children: [
            CategoryCard(
              title: "Pingômetro",
              subtitle: "Aqui se faz aqui se paga",
              icon: const Icon(
                Icons.liquor,
                size: 40,
                color: Colors.black,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
            CategoryCard(
              title: "Tarefas",
              subtitle: "Dá uma checada nas suas responsas",
              icon: const Icon(
                Icons.task,
                size: 40,
                color: Colors.white,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
          ],
        ),
        Row(
          children: [
            CategoryCard(
              title: "Horários",
              subtitle: "Aqui a gente descobre quem estuda",
              icon: Icon(
                Icons.calendar_month,
                size: 40,
                color: Colors.grey.shade400,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
            CategoryCard(
              title: "Piadocas",
              subtitle: "Conta uma ai pra nós",
              icon: Icon(
                Icons.emoji_emotions,
                size: 40,
                color: Colors.blue.shade300,
              ),
              press: () {
                debugPrint("clicou");
              },
            ),
          ],
        ),
        CategoryCard(
          title: "Fotos",
          subtitle: "Repositório dos nossos momentos",
          icon: const Icon(
            Icons.photo,
            size: 40,
            color: Colors.purple,
          ),
          press: () {
            debugPrint("clicou");
          },
        ),
      ]),
    );
  }
}
