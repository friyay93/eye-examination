import 'dart:async';

import 'package:eye_examination/symbol_e_ans.dart';
import 'package:flutter/material.dart';

class SymbolE extends StatefulWidget {
  @override
  State<SymbolE> createState() => _SymbolEState();
}

class _SymbolEState extends State<SymbolE> {
  Future? _timer;
  int countDown = 10;
  _timerCountDown() async {
// int timer;
    for (countDown; countDown > 0; countDown--) {
      await Future.delayed(const Duration(seconds: 1));
      print(countDown);
      if (mounted) {
        setState(() {});
      }
    }
  }

  // List<Map<String, String>> _choice = [
  //   {"image" : "assets/images/symbol_e.png"}
  //   ];

  Widget _symbolEWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return countDown != 0
        ? Stack(
            children: [
              // Positioned(
              //   left: size.width * 0.05,
              //   top: size.height * 0.045,
              //   child: InkWell(
              //       onTap: _timerCountDown,
              //       child: Text(
              //         countDown.toString(),
              //         style: TextStyle(
              //             fontSize: size.width * 0.1,
              //             fontWeight: FontWeight.bold),
              //       )),
              // ),
              Positioned(
                left: size.width * 0.3,
                top: size.height * 0.2,
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 34.6,
                        height: 34.6,
                        // color: Colors.red,
                        // child: RotatedBox(
                        child: Image.asset("assets/images/symbol_e.png"),
                        // quarterTurns: 4,
                      ),
                      //  ),
                    ],
                  ),
                ),
              ),

              // choice
              Positioned(
                  bottom: size.height * 0.15,
                  left: size.width * 0.25,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 10, right: 10),
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              "assets/images/symbol_e.png",
                              width: 80,
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, bottom: 10),
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              "assets/images/symbol_e.png",
                              width: 80,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            // margin: EdgeInsets.symmetric(
                            //     vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              "assets/images/symbol_e.png",
                              width: 80,
                              height: 50,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, top: 10),
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              "assets/images/symbol_e.png",
                              width: 80,
                              height: 50,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          )
        : const SymbolEAnswer();
  }

  void initState() {
    print("start");
    // _timerCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.blue.shade100,
          title: const Text(
            "Close Right Eye",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: _symbolEWidget(context),
    );
  }
}
