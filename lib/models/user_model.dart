import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  late final String name;
  final String email;
  late final String semester;
  late final String major;
  late final String picture;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.picture,
      required this.semester,
      required this.major});

  factory UserModel.fromMap(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      picture: user.photoURL ?? '',
      major: '',
      semester: '',
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
