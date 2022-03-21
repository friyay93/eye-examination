import 'dart:async';

import 'package:eye_examination/eye_dry.dart';
import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);
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
              Navigator.popAndPushNamed(context, Dummy.routeName,
                  arguments: {"_text": "1"});
            },
            child: Text('go back test')),
      ),
    );
  }
}
