import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/history.dart';
import 'package:eye_examination/models/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final List listAnswer = [74, 6, 16, 2, 29, 7, 45, 5, 97, 8, 42, 3];

class ColorBlindResult extends StatelessWidget {
  final int _totalScore;
  final List _ansList;
  ColorBlindResult(this._totalScore, this._ansList);
  static const routeName = "/bottomBarSelect";

  // add transactions
  void _addGuest(String userName, String note, String totalScore) {
    final _newDetailColorBlind =
        UserTransaction(name: userName, notes: note, score: totalScore);
    transactions.add(_newDetailColorBlind);
  }

  Future<void> _addUser(UserTransaction _userData) async {
    final _user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_user!.uid)
        .collection("test")
        .add({
      "name": _userData.name,
      "notes": _userData.notes,
      "score": _userData.score
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? _user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.38,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadiusDirectional.circular(4)),
              child: Column(
                children: [
                  const Text(
                    "Test Result",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  Text("Score(${_totalScore.toString()}/12)"),
                  //Text("Score (0/12)")
                ],
              ),
            ),
          ),
          _totalScore > 1
              ? Positioned(
                  top: size.height * 0.35,
                  left: size.width * 0.35,
                  child: Text("Normal Color Vision"),
                )
              : Positioned(
                  top: size.height * 0.3,
                  left: size.width * 0.056,
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: const [
                        Text('"Have color blindness vision"'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "In this case, it would be advisable to visit a doctor for further examination",
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
          Positioned(
            bottom: size.height * 0.3,
            left: size.width * 0.4,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (_user != null) {
                  final _newDetailColorBlind = UserTransaction(
                      name: _user.displayName,
                      notes: "Color Blind",
                      score: _totalScore.toString());
                  _addUser(_newDetailColorBlind);
                } else {
                  _addGuest("Guest", "Color Blind", _totalScore.toString());
                }
                _ansList.clear();
                Navigator.pushNamed(context, ColorBlindResult.routeName);
              },
              color: Colors.blue.shade200,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const [
                  Icon(
                    Icons.save_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
