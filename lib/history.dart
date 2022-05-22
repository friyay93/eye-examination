import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/mock/detail.dart';
import 'package:eye_examination/instruction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

final List<UserTransaction> transactions = [];

class History extends StatelessWidget {
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

_dialogUserWidget(userData, int index) {
  if ((userData.docs[index]["notes"] == "Symbol E test") ||
      (userData.docs[index]["notes"] == "Letters test") ||
      (userData.docs[index]["notes"] == "Symbol C test") ||
      (userData.docs[index]["notes"] == "Color Blind")) {
    final scoreData = userData.docs[index]["score"];
    return Column(
      children: [
        Text("คะแนนที่ได้ $scoreData"),
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
            const Text("การกะพริบตา"),
            const Spacer(),
            Text(blinkScore),
          ],
        ),
        Row(
          children: [
            const Text("ลืมตาได้นาน"),
            const Spacer(),
            Text(durationScore),
          ],
        ),
        Row(
          children: [
            const Text("คะแนนในการทำฟอร์ม"),
            const Spacer(),
            Text(formScore),
          ],
        )
      ],
    );
  }
}

_dialogGuestWidget(int index) {
  if ((transactions[index].notes == "Symbol E test") ||
      (transactions[index].notes == "Symbol C test") ||
      (transactions[index].notes == "Letters test")) {
    final scoreData = transactions[index].score;
    return Column(
      children: [
        Text("คะแนนที่ได้ ${scoreData!}"),
      ],
    );
  } else if (transactions[index].notes == "Dry Eye") {
    final score = transactions[index].score.toString();
    final setScore = score.split(RegExp(r"[A-z]"));
    final blinkScore = setScore[13];
    final durationScore = setScore[26];
    final formScore = setScore[35];
    return Column(
      children: [
        Row(
          children: [
            const Text("การกะพริบตา"),
            const Spacer(),
            Text(blinkScore),
          ],
        ),
        Row(
          children: [
            const Text("ลืมตาได้นาน"),
            const Spacer(),
            Text(durationScore),
          ],
        ),
        Row(
          children: [
            const Text("คะแนนในการทำฟอร์ม"),
            const Spacer(),
            Text(formScore),
          ],
        )
      ],
    );
  } else if (transactions[index].notes == "Color Blind") {
    final scoreData = transactions[index].score;
    return Column(
      children: [
        Text("คะแนนที่ได้ ${scoreData!}"),
      ],
    );
  } else if (transactions[index].notes == "Symbol C test") {
    final scoreData = transactions[index].score;
    return Column(
      children: [
        Text(scoreData!),
      ],
    );
  } else {
    final scoreData = transactions[index].score;
    return Column(
      children: [
        Text(scoreData!),
      ],
    );
  }
}

Widget _userTransaction(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("test")
        .snapshots(),
    builder: (context, snapshots) {
      final _testDocs = snapshots.data;
      if (snapshots.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshots.hasError) {
        print("something went wrong");
      }
      if (_testDocs!.docs.isNotEmpty) {
        return ListView.builder(
          itemCount: snapshots.data!.docs.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTapDown: (details) {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("View Results"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [_dialogUserWidget(_testDocs, index)],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2.3),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            offset:
                                const Offset(0, 7) // changes position of shadow
                            ),
                      ],
                    ),
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                NetworkImage(user.photoURL as String),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 200,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "Name : ${_testDocs.docs[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Disease : ${_testDocs.docs[index]['notes']}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
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
      return Instruction(); // return page say hello !!
    },
  );
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
                showDialog(
                  context: ctx,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      title: const Text("View Results"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [_dialogGuestWidget(index)],
                      ),
                    );
                  },
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
