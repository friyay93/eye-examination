import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/home_screen.dart';
import 'package:flutter/material.dart';

class ColorBlindDetail extends StatelessWidget {
  final int _indexDetail;
  ColorBlindDetail(this._indexDetail);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        // elevation: 2,
        child: Stack(children: [
      Positioned(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(border: Border.all(width: 2)),
          child: Column(
            children: [
              Center(
                child:
                    Text("Name: ${transactions[_indexDetail].name.toString()}"),
              ),
              Center(
                child: Text(
                    "Disease: ${transactions[_indexDetail].notes.toString()}"),
              ),
              Center(
                child: Text("${transactions[_indexDetail].score.toString()}"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("get back"))
            ],
          ),
        ),
      ),
    ]));
  }
}
