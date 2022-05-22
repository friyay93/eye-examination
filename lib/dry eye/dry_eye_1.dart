import 'package:eye_examination/dry%20eye/dry_blink_test.dart';
import 'package:flutter/material.dart';

class DryEye1 extends StatefulWidget {
  DryEye1({Key? key}) : super(key: key);

  @override
  State<DryEye1> createState() => _DryEye1State();
}

class _DryEye1State extends State<DryEye1> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/doctor.jpg",
            width: 500,
          ),
          const Text(
            "อัตราการกะพริบตา",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DryBlinkTest(index);
                  },
                ),
              );
            },
            elevation: 1,
            child:
                const Icon(Icons.navigate_next, color: Colors.blue, size: 40),
            backgroundColor: Colors.grey.shade100,
          )
        ],
      ),
    );
  }
}
