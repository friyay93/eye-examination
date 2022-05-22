import 'dart:ui';

import 'package:eye_examination/color%20blind/color_blind_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ColorBlindInstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Color Blind Test",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          Center(
            child: Image.asset(
              "assets/images/color-blind-test.png",
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: const Text(
                    "You have to enter the number(s) for each plate you can see.",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  width: 300,
                  child: const Text(
                    "If you don't see anything just click to the next button.",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  width: 300,
                  child: const Text("There will be 12 plates.",
                      style: TextStyle(fontSize: 17)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: const Text(
                    "       Example: This Number is 8. Click to the next button to start !",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ColorBlindTest(),
              ),
            ),
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
        ],
      ),
    );
  }
}

class ColorBlindForm extends StatefulWidget {
  static const routeName = "/blindTest";
  @override
  State<ColorBlindForm> createState() => _ColorBlindFormState();
}

class _ColorBlindFormState extends State<ColorBlindForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textcontroller = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.blue.shade100,
          centerTitle: true,
          title: const Text(
            "Color Blind Section",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          // Form(
          //   key: _formKey,
          //   child: Expanded(
          //     child: ListView(
          //       children: <Widget>[
          //         SizedBox(
          //           height: size.height * 0.3,
          //         ),
          //         Row(
          //           children: <Widget>[
          //             Expanded(
          //               child: SizedBox(
          //                 width: 200,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(16.0),
          //                   child: TextFormField(
          //                     decoration: const InputDecoration(
          //                       labelText: 'Enter the YourName',
          //                       contentPadding: EdgeInsets.all(10),
          //                     ),
          //                     validator: (value) {
          //                       if (value == null || value.isEmpty) {
          //                         return 'Please enter some answer';
          //                       }
          //                       return null;
          //                     },
          //                     keyboardType: TextInputType.name,
          //                     textInputAction: TextInputAction.done,
          //                     controller: _textcontroller,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: size.height * 0.13,
          //         ),
          //         SizedBox(
          //           //width: size.width * 0.2,
          //           height: size.height * 0.1,
          //           child: FloatingActionButton(
          //             onPressed: () {
          //               if (_formKey.currentState!.validate()) {
          //                 if (user != null) {
          //                   Navigator.pushNamed(
          //                       context, ColorBlindForm.routeName,
          //                       arguments: {"_text": user?.displayName});
          //                 } else {
          //                   Navigator.pushNamed(
          //                       context, ColorBlindForm.routeName,
          //                       arguments: {"_text": _textcontroller.text});
          //                 }
          //               }
          //             },
          //             elevation: 8,
          //             backgroundColor: Colors.green.shade400,
          //             child: const Text("GO"),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Container(
          //     decoration: BoxDecoration(border: Border.all(width: 1)),
          //   ),
          // )
        ],
      ),
    );
  }
}
