import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/history.dart';
import 'package:eye_examination/models/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultDryEye extends StatelessWidget {
  int totalScore;
  ResultDryEye({required this.totalScore});

  // Future _getData() async {
  //   try {
  //     // final clearJson = await http.get(Uri.parse(url));
  //     const url = "https://my-app-vkvof.ondigitalocean.app/returnValue";
  //     final res = await http.get(Uri.parse(url));
  //     if (res.statusCode == 200) {
  //       List<int> result = [];
  //       final resBody = jsonDecode(res.body);
  //       result.add(resBody["BlinkFrequency"]);
  //       result.add(resBody["IntervalTime"]);
  //       print("resboy $hashCode");
  //       print("result $result");
  //       return result; // {}
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     print("Error : $e");
  //   }
  // }

  Future _getData() async {
    final bodyBlink;
    final bodyTime;
    List<String> resList = [];
    try {
      const blinkUrl =
          "https://my-app-vkvof.ondigitalocean.app/returnValueBlink";
      const timeUrl = "https://my-app-vkvof.ondigitalocean.app/returnValueTime";
      final resBlink = await http.get(Uri.parse(blinkUrl));
      final resTime = await http.get(Uri.parse(timeUrl));
      if (resBlink.statusCode == 200 && resTime.statusCode == 200) {
        bodyBlink = jsonEncode(resBlink.body);
        bodyTime = jsonEncode(resTime.body);
        resList.add(bodyBlink);
        resList.add(bodyTime);
        return resList;
      } else {
        return Text("data");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              print("snapshot : " + snapshot.data.toString());
              final score = snapshot.data as List<String>;
              final blinkScore = score[0];
              final durationScore = score[1];
              Size size = MediaQuery.of(context).size;
              return Stack(
                children: [
                  Positioned(
                    height: size.height * 0.7,
                    left: size.width * 0.35,
                    child: Center(
                      child: CircularPercentIndicator(
                        radius: 55.0,
                        lineWidth: 12.0,
                        percent: ((100 * totalScore) / 60) / 100,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue.shade400,
                        center: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "$totalScore คะแนน",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.2,
                    bottom: size.height * 0.28,
                    child: Container(
                      width: 100,
                      child: Column(
                        children: [
                          const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "อัตราการกระพริบตา",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          FittedBox(
                            child: Text("$blinkScore / x"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.2,
                    bottom: size.height * 0.28,
                    child: Container(
                      width: 100,
                      child: Column(
                        children: [
                          const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "ระยะเวลากระพริบตา",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          FittedBox(
                            child: Text("$durationScore / x"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.4,
                    bottom: 30,
                    child: FloatingActionButton(
                      child: const Icon(Icons.back_hand),
                      onPressed: () {
                        final _user = FirebaseAuth.instance.currentUser;
                        if (_user != null) {
                          final _userTrans = UserTransaction(
                              name: _user.displayName,
                              notes: "Dry Eye",
                              score:
                                  "blink frequent $blinkScore blink duration $durationScore form score $totalScore");
                          final _addUser = UserTransaction();
                          _addUser.addRecord(_userTrans);
                        } else if (_user == null) {
                          final _userExamTransactions = UserTransaction(
                            name: "Guest",
                            notes: "Dry Eye",
                            score:
                                "blink frequent $blinkScore blink duration $durationScore form score $totalScore",
                          );
                          transactions.add(_userExamTransactions);
                        }

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomBarSelect(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Container(
              child: Text(snapshot.data.toString()),
            ),
          );
        },
      ),
    );
  }
}

// blink duration blink frequency
