import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return user != null
        ? Stack(
            children: [
              const Positioned(
                left: 50,
                top: 110,
                child: Text(
                  "Hi !",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  left: 90,
                  top: 220,
                  child: Container(
                    width: 200,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                          FirebaseAuth.instance.currentUser!.displayName!,
                          style: TextStyle(fontSize: 40)),
                    ),
                  ))
            ],
          )
        : Stack(
            children: [
              const Positioned(
                left: 50,
                top: 110,
                child: Text(
                  "Hi !",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  left: 90,
                  top: 220,
                  child: Container(
                    width: 150,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("Guest", style: TextStyle(fontSize: 40)),
                    ),
                  ))
            ],
          );
  }
}
