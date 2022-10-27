import 'package:coliscontas/components/rounded_button.dart';
import 'package:coliscontas/constants.dart';
import 'package:coliscontas/database/user/user_repository.dart';
import 'package:coliscontas/helpers/image_picker_helper.dart';
import 'package:coliscontas/helpers/loader.dart';
import 'package:coliscontas/models/user_model.dart';
import 'package:coliscontas/providers/provider.dart';
import 'package:flutter/material.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({Key? key}) : super(key: key);
  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> with Loader {
  late var user = UserRepository().getUser();
  late TextEditingController nameEC = TextEditingController();
  final semesterEC = TextEditingController(text: '9º período');
  final majorEC =
      TextEditingController(text: 'Engenharia de Controle e Automação');
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  late String userPhoto = '';

  @override
  void initState() {
    super.initState();
    nameEC.text = user.name;
    emailEC.text = user.email;
    semesterEC.text = user.semester;
    majorEC.text = user.major;
    userPhoto = user.picture;
  }

  @override
  void setState(VoidCallback fn) {
    getIt<UserRepository>().getUser();
    super.setState(fn);
  }

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    majorEC.dispose();
    semesterEC.dispose();
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
                onTap: () async {
                  await ImagePickerHelper().pickAndUploadImage(user);
                  setState(() {
                    userPhoto = user.picture;
                  });
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * .3,
                  backgroundColor: Colors.grey[300],
                  foregroundImage: NetworkImage(userPhoto),
                  backgroundImage: const NetworkImage(
                      'https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png'),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
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
                  labelText: 'Período',
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
                  label: Text('Curso'),
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
}
