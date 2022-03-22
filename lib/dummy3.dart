import 'dart:async';

import 'package:eye_examination/dummy2.dart';
import 'package:flutter/material.dart';
import 'eye_dry.dart';

class Dummy3 extends StatelessWidget {
  static const routeName = '/return';

  _delayBack(BuildContext ctx) {
    Timer(Duration(seconds: 5), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              colorList[2] = Colors.grey;
              print(colorList[0]);
              Navigator.popAndPushNamed(context, Dummy2.routeName,
                  arguments: {"_pageList": "3"});
            },
            child: Text('go back test3')),
      ),
    );
  }
}
