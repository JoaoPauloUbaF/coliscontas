import 'dart:io';

import 'package:coliscontas/providers/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/user_model.dart';

class UserRepository {
  final storageRef = FirebaseStorage.instance.ref();

  Future<Reference> getUserStorage(String userUid) async {
    final userRef = storageRef.child(userUid);
    return userRef;
  }

  Future<String> getUserPhoto(String userUid) async {
    final userPhotoRef = await storageRef
        .child('Users/$userUid/profilepic.png')
        .getDownloadURL();
    return userPhotoRef;
  }

  UserModel getUser() {
    final result = FirebaseAuth.instance.currentUser!;
    return UserModel.fromMap(result);
  }

  User getUserInstance() {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<void> uploadImageStorage(UserModel user, String path) async {
    File file = File(path);
    try {
      final ref = storageRef.child('Users/${user.id}/profilepic.png');
      await ref.putFile(file);
      await getIt<UserRepository>()
          .getUserInstance()
          .updatePhotoURL(await getUserPhoto(user.id));
      user.updateUser(user, null, null, null, await ref.getDownloadURL());
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload ?: ${e.code}');
    }
  }

  Future<void> uploadUser(UserModel userModel) async {}
}
