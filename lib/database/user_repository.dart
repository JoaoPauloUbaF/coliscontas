import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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
}
