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

  Widget _symbolEWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return countDown != 0
        ? Stack(children: [
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.045,
              child: InkWell(
                  onTap: _timerCountDown,
                  child: Text(
                    countDown.toString(),
                    style: TextStyle(
                        fontSize: size.width * 0.1,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Center(
              child: Container(
                  width: size.width * 0.65,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.04,
                        height: size.height * 0.04,
                        // color: Colors.red,
                        child: RotatedBox(
                          child: Image.asset("assets/images/symbol_e.png"),
                          quarterTurns: 4,
                        ),
                      ),
                    ],
                  )),
            ),
          ])
        : SymbolEAnswer();
  }

  void initState() {
    print("start");
    _timerCountDown();
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
