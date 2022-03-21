import 'package:flutter/material.dart';

class SymbolEAnswer extends StatelessWidget {
  const SymbolEAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: size.width * 0.2,
          top: size.height * 0.1,
          child: Container(
            child: Text(
              "What did you see ? ",
              style: TextStyle(fontSize: size.width * 0.07),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.2,
          top: size.height * 0.25,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8, bottom: 8),
                    padding: EdgeInsets.all(3),
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.asset("assets/images/symbol_e.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.all(3),
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.asset("assets/images/symbol_e.png"),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(3),
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.asset("assets/images/symbol_e.png"),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.asset("assets/images/symbol_e.png"),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
