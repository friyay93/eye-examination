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
                left: size.width * 0.27,
                top: size.height * 0.3,
                child: Image.asset(
                  "assets/images/unknown.png",
                  width: size.width * 0.5,
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Positioned(
                left: size.width * 0.27,
                top: size.height * 0.3,
                child: Image.asset(
                  "assets/images/unknown.png",
                  width: size.width * 0.5,
                ),
              ),
            ],
          );
  }
}
