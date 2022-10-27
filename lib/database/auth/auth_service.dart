import 'package:coliscontas/database/user/user_repository.dart';
import 'package:coliscontas/providers/provider.dart';
import 'package:coliscontas/screens/HomePage/home_page.dart';
import 'package:coliscontas/screens/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginScreen();
          }
        });
  }

  Future signUpEmailAndPassword(String email, String password, String userName,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((UserCredential userCredential) => {
                userCredential.user!.updateDisplayName(userName),
                userCredential.user!.updatePhotoURL(
                    "https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png"),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                ),
              });
    } on FirebaseAuthException catch (e) {
      debugPrint('Failed with error code: ${e.code}');
      debugPrint(e.message);
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential? userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    getIt<UserRepository>().getUser();
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
    // Once signed in, return the UserCredential
    return userCredential;
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        getIt<UserRepository>().getUser();
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Usuário não encontrado"),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Senha incorreta"),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
