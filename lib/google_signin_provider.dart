import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignin = GoogleSignIn();

  GoogleSignInAccount? _user; // TYPE = GOOGLESIGNINACCOUNT
  GoogleSignInAccount? get user => _user;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignin.signIn();
      _user = googleUser;
      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } on PlatformException catch (error) {
      print(error.details);
      Fluttertoast.showToast(msg: error.details, gravity: ToastGravity.TOP);
    }
  }

  Future logout() async {
    await googleSignin.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
