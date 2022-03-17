import 'package:flutter/material.dart';

class AddCaseScreen extends StatelessWidget {
  static const routeName1 = "/eyeExam";
  static const routeName2 = "/colorBlindForm";
  static const routeName3 = "/eyeDry";

  Widget _addCaseWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return Stack(
      children: [
        Positioned(
          left: size.width * 0.1,
          top: size.height * 0.3 - (size.height * 0.08),
          child: InkWell(
            onTap: () => Navigator.pushNamed(ctx, AddCaseScreen.routeName3),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 2),
                  color: Colors.blue),
              width: size.width * 0.8,
              height: 100,
              child: const Center(
                child: Text(
                  "Eye Dry ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              //  color: Colors.red,
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.1,
          top: size.height * 0.5 - (size.height * 0.08),
          child: InkWell(
            onTap: () => Navigator.pushNamed(ctx, AddCaseScreen.routeName1),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 2),
                  color: Colors.blue.shade50),
              width: size.width * 0.37,
              height: 100,
              child: const Center(
                  child: Text(
                "Eye Exam",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              //  color: Colors.red,
            ),
          ),
        ),
        Positioned(
          left: (size.width * 0.2 * 2) +
              size.width * 0.1 * 1.5 -
              size.width * 0.02,
          top: size.height * 0.5 - (size.height * 0.08),
          child: InkWell(
            onTap: () => Navigator.pushNamed(ctx, AddCaseScreen.routeName2),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(width: 2),
                  color: Colors.blue.shade50),
              width: size.width * 0.37,
              height: 100,
              child: const Center(
                  child: Text(
                "Color Blind",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              //  color: Colors.red,
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
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.blue.shade100,
            automaticallyImplyLeading: false,
            title: const Text(
              "Select Case",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: _addCaseWidget(context));
    //
  }
}
