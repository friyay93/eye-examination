import 'package:eye_examination/bottom_bar.dart';
import 'package:flutter/material.dart';

// _question[_questionIndex]['level']
// ${_question[_questionIndex]['level']}

class SymbolEResult extends StatelessWidget {
  final List _question;
  final int _questionIndex;
  SymbolEResult(this._question, this._questionIndex);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: size.width * 0.5 - (size.width * 0.4 / 2),
            top: size.height * 0.25 -
                AppBar.preferredHeightFor(context,
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.08)),
            child: Container(
              width: size.width * 0.4,
              //  color: Colors.red,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Text("Vision Score",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.27,
            left: size.width * 0.5 - (size.width * 0.6 / 2),
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(width: 3), color: Colors.blue.shade100),
              child: Center(
                  child: _questionIndex == 6
                      ? Text(
                          "this is max level : ${_question[_questionIndex - 1]['level']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        )
                      : Text("${_question[_questionIndex]['level']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23))),
            ),
          ),
          Positioned(
            top: size.height * 0.52,
            left: size.width * 0.185,
            child: Column(
              children: [
                Text(
                  " * นี่เป็นเพียงการทดสอบเบื้องต้น",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
                Text(
                  "กรุณาไปพบแพทย์เพื่อตรวจสอบอย่างละเอียด",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BottomBarSelect())));
              },
              child: Text("Back"),
            ),
          )
        ],
      ),
    );
  }
}

// นี่เป็นเพียงการทดสอบเบื้องต้น
// กรุณาไปพบแพทย์เพื่อตรวจสอบอย่างละเอียด