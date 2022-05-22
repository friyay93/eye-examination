import 'package:eye_examination/dry%20eye/dry_blink_test.dart';
import 'package:eye_examination/dry%20eye/dry_eye_1.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class DryEyeTest extends StatefulWidget {
  const DryEyeTest({Key? key}) : super(key: key);

  @override
  State<DryEyeTest> createState() => _DryEyeTestState();
}

class _DryEyeTestState extends State<DryEyeTest> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Dry Eye ",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.38,
            child: const Text(
              "Process",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: size.width * 0.028,
            top: size.height * 0.15,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: size.width * 0.91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "1. ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Text(
                    "อัตราการกะพริบตา",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    size: size.width * 0.15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: size.width * 0.028,
            top: size.height * 0.3,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: size.width * 0.91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "2. ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Text(
                    "เวลาในการกะพริบตา",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.timer_sharp,
                    size: size.width * 0.15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: size.width * 0.028,
            top: size.height * 0.45,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: size.width * 0.91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "3. ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Text(
                    "แบบสอบถามตาแห้ง",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.question_answer,
                    size: size.width * 0.15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.26,
            bottom: 100,
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DryEye1();
                    },
                  ),
                );
                // const url =
                //     "https://my-app-vkvof.ondigitalocean.app/clearValue";

                // final clearJson = await http.get(Uri.parse(url));
                // if (clearJson.statusCode == 200) {
                //   print("clear success");
                // } else {
                //   print("not clear ");
                // }
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
          )
        ],
      ),
    );
  }
}
