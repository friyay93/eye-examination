import 'dart:math';
import 'package:eye_examination/history.dart';
import 'package:eye_examination/models/transaction.dart';
import 'package:eye_examination/eye%20exam/symbol_e_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EyeExamTest extends StatefulWidget {
  @override
  State<EyeExamTest> createState() => _EyeExamTestState();
}

class _EyeExamTestState extends State<EyeExamTest> {
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
      "wrongCount": 2,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
    {
      "level": "20/70",
      "size": 10,
      "rotate": [4, 3, 4, 2],
      "wrongCount": 2,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
    {
      "level": "20/50",
      "size": 8,
      "rotate": [1, 2, 2, 3, 3],
      "wrongCount": 1,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
    {
      "level": "20/40",
      "size": 6,
      "rotate": [1, 4, 3, 2, 1, 4],
      "wrongCount": 2,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
    {
      "level": "20/30",
      "size": 5,
      "rotate": [4, 2, 3, 3, 1, 4, 2],
      "wrongCount": 2,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
    {
      "level": "20/20",
      "size": 3,
      "rotate": [4, 2, 1, 3, 4, 2, 1],
      "wrongCount": 2,
      "words": ["C", "D", "E", "F", "L", "O", "P", "T", "Z"]
    },
  ];

  // ลดระดับกลับ Index แรก
  final _userModel = UserTransaction();
  int _score = 0;
  int _questionIndex = 1;
  int _count = 1;
  int _wrong = 0;
  int _itemIndex = 0;
  int _wrongFrequency = 0;
  final List _testLettersList = [];
  final _words = ["C", "D", "E", "F", "L", "O", "P", "T", "Z"];

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final _type = routeArgs['type'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Color $_type Test",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: _type == "e"
          ? _symbolEWidget(context)
          : _type == "c"
              ? _symbolCWidget(context)
              : _type == "letter"
                  ? _letterWidget(context)
                  : const Center(
                      child: Text("Not my type"),
                    ),
    );
  }

  _checkAnswerE(int index) {
    if (_wrongFrequency == 2) {
      if (FirebaseAuth.instance.currentUser != null) {
        final _username = FirebaseAuth.instance.currentUser!.displayName;
        final _userExamTransactions = UserTransaction(
          name: _username,
          notes: "Symbol E test",
          score: "${_question[_questionIndex]['level']}",
        );
        _userModel.addRecord(_userExamTransactions);
        print("Hello");
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SymbolEResult(_question, _questionIndex);
            },
          ),
        );
      } else if (FirebaseAuth.instance.currentUser == null) {
        final _userExamTransactions = UserTransaction(
          name: "Guest",
          notes: "Symbol E test",
          score: "${_question[_questionIndex]['level']}",
        );
        transactions.add(_userExamTransactions);
        print("Hello");

        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SymbolEResult(_question, _questionIndex);
            },
          ),
        );
      }
    } else if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] ==
        _answer[index]['rotate']) {
      if (_itemIndex + 1 ==
          (_question[_questionIndex]['rotate'] as List<int>).length) {
        if (_count + 1 == _question.length) {
          if (FirebaseAuth.instance.currentUser != null) {
            final _username = FirebaseAuth.instance.currentUser!.displayName;
            final _userExamTransactions = UserTransaction(
              name: _username,
              notes: "Symbol E test",
              score: "${_question[_questionIndex]['level']}",
            );
            _userModel.addRecord(_userExamTransactions);
            print("Hello");
            return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SymbolEResult(_question, _questionIndex);
                },
              ),
            );
          } else if (FirebaseAuth.instance.currentUser == null) {
            print("Hello");
            final _userExamTransactions = UserTransaction(
              name: "Guest",
              notes: "Symbol E test",
              score: "${_question[_questionIndex]['level']}",
            );
            transactions.add(_userExamTransactions);
            return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SymbolEResult(_question, _questionIndex);
                },
              ),
            );
          }
        } else {
          setState(() {
            _questionIndex++;
            _score = 0;
            _itemIndex = -1;
            _answer.shuffle();
          });
        }
        _count++;
      }
      setState(() {
        _score++;
        _itemIndex++;
        _answer.shuffle();
      });
    } else

    // wrong check
    {
      if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] !=
          _answer[index]['rotate']) {
        if (_wrong == _question[_questionIndex]['wrongCount']) {
          _wrongFrequency++;
          if (_questionIndex > 0) {
            setState(() {
              _questionIndex--;
              _itemIndex = 0;
              _answer.shuffle();
            });
          }
          _wrong = 0;
        } else if (_wrong <
            double.parse(_question[_questionIndex]['wrongCount'].toString())
                .toInt()) {
          if (_itemIndex == 0) {
            _itemIndex =
                (_question[_questionIndex]['rotate'] as List<int>).length - 1;
            setState(() {
              _answer.shuffle();
            });
          } else if (_itemIndex > 0) {
            _itemIndex--;
            setState(() {
              _answer.shuffle();
            });
          }
          _wrong++;
        }
      }
    }
  }

  _checkAnswerC(int index) {
    if (_wrongFrequency == 2) {
      // check user
      if (FirebaseAuth.instance.currentUser != null) {
        final _username = FirebaseAuth.instance.currentUser!.displayName;
        final _userExamTransactions = UserTransaction(
            name: _username,
            notes: "Symbol C test",
            score: "${_question[_questionIndex]['level']}");
        _userModel.addRecord(_userExamTransactions);
      } else {
        final _userExamTransactions = UserTransaction(
            name: "Guest",
            notes: "Symbol C test",
            score: "${_question[_questionIndex]['level']}");
        transactions.add(_userExamTransactions);
      }
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return SymbolEResult(_question, _questionIndex);
          },
        ),
      );
    } else if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] ==
        _answer[index]['rotate']) {
      if (_itemIndex + 1 ==
          (_question[_questionIndex]['rotate'] as List<int>).length) {
        if (_count + 1 == _question.length) {
          if (FirebaseAuth.instance.currentUser != null) {
            final _username = FirebaseAuth.instance.currentUser!.displayName;
            final _userExamTransactions = UserTransaction(
                name: _username,
                notes: "Symbol C test",
                score: "${_question[_questionIndex]['level']}");
            _userModel.addRecord(_userExamTransactions);
          } else {
            final _userExamTransactions = UserTransaction(
                name: "Guest",
                notes: "Symbol C test",
                score: "${_question[_questionIndex]['level']}");
            transactions.add(_userExamTransactions);
          }

          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return SymbolEResult(_question, _questionIndex);
              },
            ),
          );
        } else {
          setState(() {
            _questionIndex++;
            _score = 0;
            _itemIndex = -1; //
            _answer.shuffle();
          });
        }
        _count++;
      }
      setState(() {
        _score++;
        _itemIndex++;
        _answer.shuffle();
      });
    } else {
      if ((_question[_questionIndex]['rotate'] as List<int>)[_itemIndex] !=
          _answer[index]['rotate']) {
        if (_wrong == _question[_questionIndex]['wrongCount']) {
          _wrongFrequency++;
          if (_questionIndex > 0) {
            setState(() {
              _questionIndex--;
              _itemIndex = 0;
              _answer.shuffle();
            });
          }
          _wrong = 0;
        } else if (_wrong <
            double.parse(_question[_questionIndex]['wrongCount'].toString())
                .toInt()) {
          if (_itemIndex == 0) {
            _itemIndex =
                (_question[_questionIndex]['rotate'] as List<int>).length - 1;
            setState(() {
              _answer.shuffle();
            });
          } else if (_itemIndex > 0) {
            _itemIndex--;
            setState(() {
              _answer.shuffle();
            });
          }
          _wrong++;
        }
      }
    }
  }

  _checkLetter(index, List _numberChoiceList) {
    if (_wrongFrequency == 2) {
      if (FirebaseAuth.instance.currentUser != null) {
        final _username = FirebaseAuth.instance.currentUser!.displayName;
        final _userExamTransactions = UserTransaction(
            name: _username,
            notes: "Letters test",
            score: "${_question[_questionIndex]['level']}");
        print("add");
        _userModel.addRecord(_userExamTransactions);
        print("add complete");
      } else {
        final _userExamTransactions = UserTransaction(
            name: "Guest",
            notes: "Letters test",
            score: "${_question[_questionIndex]['level']}");
        transactions.add(_userExamTransactions);
      }
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return SymbolEResult(_question, _questionIndex);
      }));
    } else if (_words[_testLettersList[0]] ==
        _words[_numberChoiceList[index]]) {
      if (_itemIndex + 1 ==
          (_question[_questionIndex]['rotate'] as List<int>).length) {
        if (_count + 1 == _question.length) {
          if (FirebaseAuth.instance.currentUser != null) {
            final _username = FirebaseAuth.instance.currentUser!.displayName;
            final _userExamTransactions = UserTransaction(
                name: _username,
                notes: "Letters Test",
                score: "${_question[_questionIndex]['level']}");
            print("add");
            _userModel.addRecord(_userExamTransactions);
            print("add complete");
          } else {
            final _userExamTransactions = UserTransaction(
                name: "Guest",
                notes: "Letters Test",
                score: "${_question[_questionIndex]['level']}");
            transactions.add(_userExamTransactions);
          }

          return Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return SymbolEResult(_question, _questionIndex);
          }));
        } else {
          setState(() {
            _questionIndex++;
            _score = 0;
            _itemIndex = -1;
            _count++;
            print("questionIndex $_questionIndex");
            print(_count);

            _testLettersList.clear();
            //  print("questionIndex after $_questionIndex");
          });
        }
      }
      setState(() {
        _score++;
        _itemIndex++;
        // _shuffleTest();
        _testLettersList.clear();
      });
    } else
//  wrong check
    {
      if (_words[_testLettersList[0]] != _words[_numberChoiceList[index]]) {
        if (_wrong == _question[_questionIndex]['wrongCount']) {
          _wrongFrequency++;
          if (_questionIndex > 0) {
            setState(() {
              _questionIndex--;
              _itemIndex = 0;
              //  _testLettersList.clear();
            });
          }
          _wrong = 0;
        } else if (_wrong <
            double.parse(_question[_questionIndex]['wrongCount'].toString())
                .toInt()) {
          if (_itemIndex == 0) {
            _itemIndex =
                (_question[_questionIndex]['rotate'] as List<int>).length - 1;
            setState(() {
              _testLettersList.clear();
            });
          } else if (_itemIndex > 0) {
            _itemIndex--;
            setState(() {
              _testLettersList.clear();
            });
          }
          _wrong++;
        }
      }
    }
  }

  Widget _symbolEWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return _wrongFrequency < 2 && _count + 1 < _question.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
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
                          double.parse(
                        (_question[_questionIndex]['rotate']
                                as List<int>)[_itemIndex]
                            .toString(),
                      ).toInt(),
                      child: Image.asset(
                        "assets/images/symbol_e.png",
                        width: double.parse(
                            _question[_questionIndex]["size"].toString()),
                        height: double.parse(
                            _question[_questionIndex]["size"].toString()),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GridView.builder(
                    padding: const EdgeInsets.all(30),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                _checkAnswerE(index);
                                // print(index);
                              },
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.1,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(),
                                child: RotatedBox(
                                    quarterTurns:
                                        _answer[index]["rotate"] as int,
                                    child: Image.asset(
                                        "assets/images/symbol_e.png")),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          )
        : SymbolEResult(_question, _questionIndex);
  }

  Widget _symbolCWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return _wrongFrequency < 2 && _count + 1 < _question.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
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
                        "assets/images/symbol_c.png",
                        width: double.parse(
                            _question[_questionIndex]["size"].toString()),
                        height: double.parse(
                            _question[_questionIndex]["size"].toString()),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GridView.builder(
                    padding: const EdgeInsets.all(30),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                _checkAnswerC(index);
                                // print(index);
                              },
                              child: Container(
                                width: size.width * 0.2,
                                height: size.height * 0.1,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(),
                                child: RotatedBox(
                                    quarterTurns:
                                        _answer[index]["rotate"] as int,
                                    child: Image.asset(
                                        "assets/images/symbol_c.png")),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          )
        : SymbolEResult(_question, _questionIndex);
  }

  _shuffleTest() {
    final _letterNumberRnd = Random().nextInt(_words.length);
    final _testLetters = _letterNumberRnd;

    // random number
    _testLettersList.add(_testLetters);
    return _testLettersList[0]; // return index
  }

  Widget _shuffleChoice(Size size) {
    List _numberChoiceList = [];
    final _letterList = _question[_questionIndex]["words"] as List;
    final _answerChoice = _shuffleTest();
    _numberChoiceList.add(_answerChoice);
    for (var i = 0; i <= 2; i++) {
      int? _letterNumberRnd;
      _letterNumberRnd = Random().nextInt(_letterList.length);
      while (_numberChoiceList.contains(_letterNumberRnd)) {
        _letterNumberRnd = Random().nextInt(_letterList.length);
      }
      _numberChoiceList.add(_letterNumberRnd);
    }
    _numberChoiceList.shuffle();
    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.builder(
        padding: const EdgeInsets.all(30),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          childAspectRatio: 1.2,
        ),
        itemCount: _numberChoiceList.length,
        itemBuilder: (ctx, index) {
          // print(_numberChoiceList[index]);
          return Column(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                color: Colors.blue.shade100,
              ),
              child: InkWell(
                onTap: () {
                  // print(
                  //     "check answer ${(_question[_questionIndex]['words'] as List)[_numberChoiceList[index]]}");
                  _checkLetter(index, _numberChoiceList);
                },
                splashColor: Colors.grey,
                child: Container(
                  width: size.width * 0.2,
                  height: size.height * 0.1,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(),
                  child: Center(
                    child: Text(
                      "${(_question[_questionIndex]['words'] as List)[_numberChoiceList[index]]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  Widget _letterWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return
        //_wrongFrequency < 2 && _count + 1 < _question.length
        // ?
        Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          width: size.width * 0.6,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                width:
                    double.parse(_question[_questionIndex]["size"].toString()),
                height:
                    double.parse(_question[_questionIndex]["size"].toString()),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    (_question[_questionIndex][
                            "words"] // ["C", "D", "E", "F", "L", "O", "P", "T", "Z"][index]
                        as List<String>)[_shuffleTest()],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        _shuffleChoice(size)
      ],
    );
    // : SymbolEResult(_question, _questionIndex);
  }
}
