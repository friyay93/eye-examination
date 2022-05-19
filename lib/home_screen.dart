import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/detail.dart';
import 'package:eye_examination/instruction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import './models/transaction.dart';

final List<UserTransaction> transactions = [];

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body:
          user != null ? _userTransaction(context) : _guestTransaction(context),
    ));
  }
}

_dialogWidget(userData, int index) {
  if (userData.docs[index]["notes"] == "Symbol E test") {
    final scoreData = userData.docs[index]["score"];
    return Column(
      children: [
        Text(scoreData),
      ],
    );
  } else if (userData.docs[index]["notes"] == "Dry Eye") {
    final score = userData.docs[index]["score"].toString();
    final setScore = score.split(RegExp(r"[A-z]"));
    final blinkScore = setScore[13];
    final durationScore = setScore[26];
    final formScore = setScore[35];
    return Column(
      children: [
        Row(
          children: [
            Text("การกะพริบตา"),
            Spacer(),
            Text(blinkScore),
          ],
        ),
        Row(
          children: [
            Text("ลืมตาได้นาน"),
            Spacer(),
            Text(durationScore),
          ],
        ),
        Row(
          children: [
            Text("คะแนนในการทำฟอร์ม"),
            Spacer(),
            Text(formScore),
          ],
        )
      ],
    );
  } else if (userData.docs[index]["notes"] == "Color Blind") {}
}

Widget _userTransaction(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  return Stack();
}

Widget _guestTransaction(BuildContext ctx) {
  if (transactions.isNotEmpty) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTapDown: (details) {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (context) => Detail(transactions[index], index),
                  ),
                );
              },
              child: Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.3),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 0.1,
                        blurRadius: 5,
                        offset: const Offset(0, 7) // changes position of shadow
                        ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 12, right: 12, top: 7),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue[100],
                        // Image.asset("assets/images/default_user.png"),
                        child: Image.asset("assets/images/default_user.png"),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name : ${transactions[index].name}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Disease : ${transactions[index].notes}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  return Instruction();
}
