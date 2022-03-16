import 'package:eye_examination/color_blind_test.dart';
import 'package:flutter/material.dart';

class ColorBlindInstruction extends StatelessWidget {
  // final String? _nameUser;
  // ColorBlindInstruction(this._nameUser);
  static const routeName = "/colorBlindTest";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // get args from pushnamed
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // text
    final _textName = routeArgs['_text'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Color Blind Test",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
              // color: Colors.red,
              margin: EdgeInsets.only(top: size.height / 11),
              //padding: EdgeInsets.only(top: 200),
              height: size.height / 2,
              width: double.infinity,
              child: Center(child: Image.asset("assets/images/test_01.jpg"))),
          const SizedBox(
            height: 5,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 11),
              child: FittedBox(
                child: Center(
                  child: Text(
                    """
                  You have to enter the number(s) for each plate you can see. 
                  If you don't see anything just click to the next button. 
                  There will be 12 plates. 
                         
                  Example: This Number is 12. Click to the next button to start!""",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              )),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           ColorBlindTest(_textName.toString())),
                // );
                Navigator.pushNamed(context, ColorBlindInstruction.routeName,
                    arguments: {
                      "_text" : _textName
                    });
              },
              icon: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
              label: const Icon(
                Icons.navigate_next,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
