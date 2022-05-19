import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserTransaction {
  String? name;
  String? notes;
  String? score;

  UserTransaction({
    this.name,
    this.notes,
    this.score,
  });

  Future<void> addRecord(UserTransaction _userData) async {
    final _uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid)
        .collection("test")
        .add({
      "name": _userData.name,
      "notes": _userData.notes,
      "score": _userData.score,
    });
  }
}
