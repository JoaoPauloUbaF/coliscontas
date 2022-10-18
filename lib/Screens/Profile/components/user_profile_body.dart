import 'dart:developer';

import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/constants.dart';
import 'package:coliscontas/database/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);
  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  final user = FirebaseAuth.instance.currentUser!;
  late TextEditingController nameEC = TextEditingController();
  final semesterEC = TextEditingController(text: '9º período');
  final majorEC =
      TextEditingController(text: 'Engenharia de Controle e Automação');
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  late NetworkImage _userPhoto = const NetworkImage(
      "https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png");

  @override
  void initState() {
    super.initState();
    nameEC.text = user.displayName!;
    userImage();
  }

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: bgColorGradientTop,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .3,
                  backgroundColor: Colors.grey[300],
                  foregroundImage: _userPhoto,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
                controller: nameEC,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
                controller: semesterEC,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
                controller: majorEC,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              RoundedButton(text: 'Salvar Dados', press: () {})
            ],
          ),
        ),
      ),
    );
  }

  Future<void> userImage() async {
    final userImageRef = await UserRepository().getUserPhoto(user.uid);
    log(userImageRef);
    if (userImageRef != null) {
      setState(() {
        _userPhoto = NetworkImage(userImageRef);
      });
    }
    if (user.photoURL != null) {
      setState(() {
        _userPhoto = NetworkImage(user.photoURL!);
      });
    }
  }
}
