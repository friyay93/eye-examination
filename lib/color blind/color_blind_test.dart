import 'package:eye_examination/color%20blind/color_blind_result.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ColorBlindTest extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _ColorBlindTestState createState() => _ColorBlindTestState();
}

class _ColorBlindTestState extends State<ColorBlindTest> {
  final TextEditingController _scorecontroller = TextEditingController();

  final List _answersList = [];
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  int _imageIndex = 0;
  int _totalScore = 0;
  bool alert = true;
  final List _testList = [
    {'img': "assets/images/test_01.jpg", 'ans': '74'},
    {'img': "assets/images/test_02.jpg", 'ans': '6'},
    {'img': "assets/images/test_03.jpg", 'ans': '16'},
    {'img': "assets/images/test_04.jpg", 'ans': '2'},
    {'img': "assets/images/test_05.jpg", 'ans': '29'},
    {'img': "assets/images/test_06.jpg", 'ans': '7'},
    {'img': "assets/images/test_07.jpg", 'ans': '45'},
    {'img': "assets/images/test_08.jpg", 'ans': '5'},
    {'img': "assets/images/test_09.jpg", 'ans': '97'},
    {'img': "assets/images/test_10.jpg", 'ans': '8'},
    {'img': "assets/images/test_11.jpg", 'ans': '42'},
    {'img': "assets/images/test_12.jpg", 'ans': '3'},
  ];

  void nextImage(String _score) {
    setState(() {
      _answersList.add(_scorecontroller.text);
      if (_score == _testList[_imageIndex]['ans']) {
        _totalScore += 1;
      }
      if (_imageIndex + 1 == _testList.length) {}
      _imageIndex += 1;
    });
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          actionsPadding: const EdgeInsets.only(bottom: 25),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: Colors.blue[50],
          content: Container(
            height: 100,
            child: Column(
              children: const [
                Text(
                    """The result of this test is not a medical test result."""),
                Text(
                    """     If an abnormality is found please visit a doctor for further examination""")
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    // final _textname = routeArgs['_text'];
    if (alert) {
      Future.delayed(const Duration(seconds: 0), () => showAlert(context));
      alert = false;
    }

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
            title: const Text(
              "Color Blind Test",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: _imageIndex < _testList.length
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Image.asset(_testList[_imageIndex]['img']),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: TextFormField(
                                // autovalidateMode: AutovalidateMode.always,
                                decoration: const InputDecoration(
                                  labelText: 'Enter the Number',
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some answer';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller: _scorecontroller,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.047,
                      ),
                      FloatingActionButton(
                        elevation: 10,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            nextImage(_scorecontroller
                                .text); // + 1 before if : index = 1 in first not 0

                            _scorecontroller.clear();
                          }
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            : ColorBlindResult(_totalScore, _answersList));
  }
}
