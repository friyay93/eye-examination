import 'package:eye_examination/dry%20eye/dry_blink_test.dart';
import 'package:flutter/material.dart';

class DryEye2 extends StatefulWidget {
  int index;
  DryEye2(this.index);

  @override
  State<DryEye2> createState() => _DryEye2State();
}

class _DryEye2State extends State<DryEye2> {
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
            "วัดระยะเวลา",
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
                    return DryBlinkTest(widget.index);
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
