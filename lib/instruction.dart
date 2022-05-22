import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return user != null
        ? Stack(
            children: [
              Positioned(
                left: 50,
                top: size.height * 0.3,
                child: Image.asset(
                  "assets/images/unknown.png",
                  width: size.width * 0.7,
                  height: size.height * 0.3,
                ),
              ),
              Positioned(
                left: size.width * 0.32,
                top: size.height * 0.65,
                child: const Text(
                  "dont have data",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Positioned(
                left: 50,
                top: 110,
                child: Image.asset("assets/images/unknown.png"),
              ),
            ],
          );
  }
}
