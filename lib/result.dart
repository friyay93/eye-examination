import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/history.dart';
import 'package:eye_examination/models/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultMock extends StatefulWidget {
  int totalScore;
  ResultMock({required this.totalScore});

  @override
  State<ResultMock> createState() => _ResultMockState();
}

class _ResultMockState extends State<ResultMock> {
  bool isLoading = false;

  Future _getData() async {
    final bodyBlink;
    final bodyTime;
    List resList = [];
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
      } else {
        return "error";
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  _getBlinkValue() async {
    const blinkUrl = "https://my-app-vkvof.ondigitalocean.app/returnValueBlink";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// blink duration blink frequency
