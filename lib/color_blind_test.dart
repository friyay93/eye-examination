import 'package:eye_examination/color_blind_result.dart';
import 'package:flutter/material.dart';

final List testList = [
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

final List answersList = [];

class ColorBlindTest extends StatefulWidget {
  @override
  State<ColorBlindTest> createState() => _ColorBlindTestState();
}

class _ColorBlindTestState extends State<ColorBlindTest> {
  final TextEditingController _scorecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _imageIndex = 0;
  int _totalScore = 0;
  bool alert = true;

  void nextImage(String _score) {
    setState(() {
      answersList.add(_scorecontroller.text);
      if (_score == testList[_imageIndex]['ans']) {
        _totalScore += 1;
      }
      if (_imageIndex + 1 == testList.length) {}
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              backgroundColor: Colors.blue[50],
              content: const Text("""
        The result of this test is not 
            a medical test result.


    If an abnormality is found please  
visit a doctor for further examination."""),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final _textname = routeArgs['_text'];
    print(_textname);

    if (alert) {
      Future.delayed(const Duration(seconds: 0), () => showAlert(context));
      alert = false;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _imageIndex < testList.length
            ? Column(children: [
                Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: size.height / 2,
                    child: Image.asset(testList[_imageIndex]['img'])),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text("Enter your number : ")),
                    SizedBox(
                      width: size.width / 2,
                      // height: 35,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          // maxLength: 2,
                          controller: _scorecontroller,
                          decoration: const InputDecoration(
                              //hintText: "Enter your Answer",
                              // labelText: "Answer",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // print(_textcontroller.text);

                        nextImage(_scorecontroller
                            .text); // + 1 before if : index = 1 in first not 0

                        _scorecontroller.clear();
                      }
                    },
                    child: _imageIndex + 1 < testList.length
                        ? const Text('Next')
                        : const Text("Sumbit"),
                  ),
                ),
              ])
            : ColorBlindResult(_totalScore, _textname!, answersList));
  }
}
