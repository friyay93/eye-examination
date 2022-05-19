import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final detail;
  final int _index;
  final _user = FirebaseAuth.instance.currentUser;
  Detail(this.detail, this._index);

  _userData() {
    if (detail!.docs[_index]["notes"] == "Dry Eye") {
      final score = detail!.docs[_index]["score"].toString();
      final setScore = score.split(RegExp(r"[A-z]"));
      final blinkScore = setScore[13];
      final durationScore = setScore[26];
      final formScore = setScore[35];
      return [detail!.docs[_index], blinkScore, durationScore, formScore];
    }
    return detail!.docs[_index];
  }

  @override
  Widget build(BuildContext context) {
    // return colorCase == "Color Blind" ? DetailColorBlind() : Text("Hello");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("details"),
      ),
      body: SafeArea(
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
