import 'dart:async';

import 'package:eye_examination/eye_dry.dart';
import 'package:flutter/material.dart';

class Dummy2 extends StatelessWidget {
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
              Navigator.popAndPushNamed(context, Dummy2.routeName,
                  arguments: {"_text": "2", "color": "grey"});
            },
            child: Text('go back 2')),
      ),
    );
  }
}
