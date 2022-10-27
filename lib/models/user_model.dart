import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String semester;
  String major;
  String picture;
  bool resident = false;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.picture,
      required this.semester,
      required this.major,
      required this.resident});

  factory UserModel.fromMap(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      picture: user.photoURL ?? '',
      major: '',
      semester: '',
      resident: true,
    );
  }

  void updateUser(UserModel user, String? name, String? major, String? semester,
      String? photoURL) {
    name != null ? user.name = name : null;
    major != null ? user.major = major : null;
    semester != null ? user.semester = semester : null;
    photoURL != null ? user.picture = photoURL : null;
  }
}
