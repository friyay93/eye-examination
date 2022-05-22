
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final answerTap;

  Answer({required this.answerText, required this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 15.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
