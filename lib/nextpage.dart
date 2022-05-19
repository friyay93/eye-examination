import 'package:flutter/material.dart';

class nextpage extends StatefulWidget {

  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.0,
      margin: const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueAccent)),
      child: const Center(
        child:  Text(
          'hello',
          textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
