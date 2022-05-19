import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/dry_blink_test.dart';
import 'package:eye_examination/home.dart';
import 'package:flutter/material.dart';

List colorList = [Colors.white, Colors.white, Colors.white];

class DryEye extends StatelessWidget {
  static const routeName = "/dummy";
  final List<Widget> _pageTest = [DryBlinkTest(), DryBlinkTest()];
  Map<String, Object?> receiveData = {};
  int count = 0;
  double? valueNumber;
  int? _pageList = 0;
  List keyValue = [];

  Widget _eyeDryWidget(BuildContext ctx) {
    if (ModalRoute.of(ctx)!.settings.arguments != null) {
      final args = ModalRoute.of(ctx)?.settings.arguments as Map;
      final changeValue = double.parse(args['_pageList'].toString());
      _pageList = changeValue.toInt();
      if (_pageList == 2) {
        keyValue.add(args["keyBlink"]);
        keyValue.add(args["keyTime"]);
      }
    }
    Size size = MediaQuery.of(ctx).size;
    return Stack(
      children: [
        Positioned(
          top: (size.height * 0.3) -
              (AppBar().preferredSize.height) -
              (size.height * 0.1),
          left: 20,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                color:
                    colorList[0] == Colors.white ? Colors.white : Colors.grey),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Icon(
                  Icons.remove_red_eye,
                  size: size.width * 0.15,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  // color: Colors.red,
                  width: size.width * 0.4,
                  child: const Text(
                    """อัตราการกระพริบตา""",
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: (size.height * 0.3) -
              (AppBar().preferredSize.height) -
              (size.height * 0.1),
          right: 20,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                color:
                    colorList[1] == Colors.white ? Colors.white : Colors.grey),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Icon(
                  Icons.timer_sharp,
                  size: size.width * 0.15,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  // color: Colors.red,
                  width: size.width * 0.4,
                  child: const Text(
                    """ ระยะเวลาที่สามารถลืม
 ตาค้างได้นานที่สุด""",
                    style: TextStyle(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        // อันที่ 4
        Positioned(
          top: (size.height * 0.6) -
              (AppBar().preferredSize.height) -
              (size.height * 0.1),
          right: 108,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Icon(
                  Icons.question_answer,
                  size: size.width * 0.15,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  // color: Colors.red,
                  width: size.width * 0.4,
                  child: const Text(
                    """แบบสอบถามตาแห้ง""",
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.7,
          left: size.width * 0.26,
          child: InkWell(
            onTap: () {
              count++;
              if (_pageList != 2) {
                Navigator.pushReplacement(
                  ctx,
                  MaterialPageRoute(
                      builder: (context) => _pageTest[_pageList!]),
                );
              } else {
                Navigator.pushReplacement(
                  ctx,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home(blinkKey: keyValue[0], timeKey: keyValue[1])),
                );
              }
            },
            child: Container(
              width: 170,
              padding: const EdgeInsets.all(11),
              // width: size.width * 0.3,
              // height: size.height * 0.05,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 1,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0),
                  )
                ],
                color: const Color.fromRGBO(107, 214, 238, 1),
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Center(
                child: Text(
                  "เริ่มการทดสอบ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue.shade100,
          title: const Text(
            "Eye Dry",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: _eyeDryWidget(context),
    );
  }
}
