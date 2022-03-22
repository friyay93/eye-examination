import 'package:eye_examination/dummy.dart';
import 'package:eye_examination/dummy2.dart';
import 'package:eye_examination/dummy3.dart';
import 'package:flutter/material.dart';

List colorList = [Colors.white, Colors.white, Colors.white, Colors.white];

class EyeDry extends StatelessWidget {
  static const routeName = "/dummy";
  final List<Widget> _pageTest = [Dummy1(), Dummy2(), Dummy3()];
  Map<String, String?> number = {};
  int count = 0;
  double? valueNumber;
  int? _pageList = 0;

  Widget _eyeDryWidget(BuildContext ctx) {
    if (ModalRoute.of(ctx)!.settings != null &&
        ModalRoute.of(ctx)!.settings.arguments != null) {
      number = ModalRoute.of(ctx)!.settings.arguments as Map<String, String?>;
      print(number);
      final changeValue = double.parse(number['_pageList'].toString());
      _pageList = changeValue.toInt();
      print(_pageList);
    }

    print(_pageList.runtimeType);
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
        // อันที่ 3
        Positioned(
          top: (size.height * 0.6) -
              (AppBar().preferredSize.height) -
              (size.height * 0.1),
          left: 20,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                color:
                    colorList[2] == Colors.white ? Colors.white : Colors.grey),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Icon(
                  Icons.eleven_mp_outlined,
                  size: size.width * 0.15,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  // color: Colors.red,
                  width: size.width * 0.4,
                  child: const Text(
                    """ การวัดระดับการมองเห็น""",
                    style: TextStyle(fontSize: 13),
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
          right: 20,
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
          left: size.width * 0.35,
          child: Container(
            width: size.width * 0.3,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () async {
                // print(count);
                count++;
                // print(count);
                // Navigator.pushNamed(ctx, EyeDry.routeName);
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (context) => _pageTest[_pageList!]),
                );
              },
              child: const Center(
                child: Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
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
