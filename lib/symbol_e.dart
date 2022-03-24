import 'package:flutter/material.dart';

class SymbolE extends StatefulWidget {
  @override
  State<SymbolE> createState() => _SymbolEState();
}

class _SymbolEState extends State<SymbolE> {
  final _answer = [
    {"rotate": 1},
    {"rotate": 2},
    {"rotate": 3},
    {"rotate": 4},
  ];

  final _question = [
    {
      "level": "20/200",
      "size": 26,
      "rotate": [4, 3],
      "wrongCount": 2
    },
    {
      "level": "20/70",
      "size": 10,
      "rotate": [4, 3, 4, 2],
      "wrongCount": 2
    },
    {
      "level": "20/50",
      "size": 8,
      "rotate": [1, 2, 2, 3, 3],
      "wrongCount": 1
    },
    {
      "level": "20/40",
      "size": 6,
      "rotate": [1, 4, 3, 2, 1, 4],
      "wrongCount": 2
    },
    {
      "level": "20/30",
      "size": 5,
      "rotate": [4, 2, 3, 3, 1, 4, 2],
      "wrongCount": 2
    },
    {
      "level": "20/20",
      "size": 3,
      "rotate": [4, 2, 1, 3, 4, 2, 1],
      "wrongCount": 2
    },
  ];

  // ลดระดับกลับ Index แรก
  int _score = 0;
  int _questionIndex = 1;
  int _count = 0;
  int _wrong = 0;
  int _itemIndex = 0;
  int _wrongFrequency = 0;

  void _checkAnswer(int index) {
    print("before _questionIndex $_questionIndex");
    print("before _itemIndex $_itemIndex");
    //  print("Hello");
    // print(_answer[index]['rotate']);
    // try {
    //   final _rotateList = _question[_indexQuestion]['rotate'] as List<int>;
    //   if (_score + 1 == _rotateList.length) {
    //     print("come condition");
    //     setState(() {
    //       _indexQuestion++;
    //       _score = 0;
    //     });
    //     _count++;
    //   } else {
    //     // print("Hellworld");
    //     if (_score <= _rotateList.length) {
    //       print("Hi");
    //       // print("item : pic ${_ro9tateList[_score]}");
    //       if (_rotateList[_score] == _answer[index]['rotate']) {
    //         //  print("${_rotateList[_score]} == ${_answer[index]['rotate']}");
    //         setState(() {
    //           _score++;
    //           print("score equal : $_score");
    //         });
    //       } else if (_rotateList[_score] != _answer[index]['rotate'] &&
    //           _score - 1 != -1) {
    //         setState(() {});
    //         print(_score);

    //         _score--;
    //         print("score not equal$_score");
    //       }
    //     } else {
    //       print("Out of index");
    //     }
    //   }
    // } on Exception catch (e) {
    //   throw Exception("out index $e");
    // }
    if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] ==
        _answer[index]['rotate']) {
      if (_itemIndex + 1 ==
          (_question[_questionIndex]['rotate'] as List<int>).length) {
        print("next round");
        setState(() {
          _questionIndex++;
          _score = 0;
          _itemIndex = -1;
        });
        _count++;
      }
      print("answer is corret");
      setState(() {
        _score++;
        _itemIndex++;
        print("score $_score");
        print("item index $_itemIndex");
      });
    } else

    // wrong check
    {
      if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] !=
          _answer[index]['rotate']) {
        print("answer != test");

        if (_wrong == _question[_questionIndex]['wrongCount']) {
          _wrongFrequency++;
          print("wrong_frequency: $_wrongFrequency");
          print("_wrong == wrongCount");
          if (_questionIndex > 0) {
            setState(() {
              _questionIndex--;
              _itemIndex = 0;
            });
          }
          _wrong = 0;
          print("wrong from _wrong == wrongCount : $_wrong");
        } else if (_wrong <
            double.parse(_question[_questionIndex]['wrongCount'].toString())
                .toInt()) {
          print("_wrong < wrongCount");
          if (_itemIndex == 0) {
            print("_itemindex == 0");
            //  _questionIndex--;
            _itemIndex =
                (_question[_questionIndex]['rotate'] as List<int>).length - 1;
            setState(() {});
          } else if (_itemIndex > 0) {
            print("_itemindex > 0");
            _itemIndex--;
            setState(() {});
          }
          _wrong++;
          print("wrong score_ $_wrong score");
        }
      }
    }
    print("after _questionIndex $_questionIndex");
    print("after _itemIndex $_itemIndex");
  }

  Widget _testPictureWidget(Size size) {
    // return Positioned(
    //   left: size.width * 0.3,
    //   top: size.height * 0.2,
    //   child: Container(
    //     width: size.width * 0.4,
    //     height: size.height * 0.2,
    //     decoration:
    //         BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           width: 50,
    //           height: 50,
    //           // color: Colors.red,
    //           child: RotatedBox(
    //               quarterTurns: _answer[indexQuestion]["rotate"] as int,
    //               child: Image.asset("assets/images/symbol_e.png")),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Container(
      width: size.width * 0.6,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: // _question[_indexQuestion]["rotate"] as int,
                double.parse((_question[_questionIndex]['rotate']
                            as List<int>)[_itemIndex]
                        .toString())
                    .toInt(),
            child: Image.asset(
              "assets/images/symbol_e.png",
              width: double.parse(_question[_questionIndex]["size"].toString()),
              height:
                  double.parse(_question[_questionIndex]["size"].toString()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _answerWidget(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.builder(
          padding: EdgeInsets.all(30),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            childAspectRatio: 1.2,
          ),
          itemCount: _answer.length,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Colors.blue.shade100,
                  ),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      _checkAnswer(index);
                      // print(index);
                    },
                    child: Container(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(),
                      child: RotatedBox(
                          quarterTurns: _answer[index]["rotate"] as int,
                          child: Image.asset("assets/images/symbol_e.png")),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _symbolEWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return _wrongFrequency < 2 && _count < _question.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 25,
              ),
              _testPictureWidget(size),
              _answerWidget(size)
            ],
          )
        : Container(
            child: Center(
              child: Text(
                  "test level eye : ${_question[_questionIndex]['level']}"),
            ),
          );
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
