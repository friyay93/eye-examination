import 'package:eye_examination/dummy.dart';
import 'package:flutter/material.dart';

import 'color_blind_result.dart';

class EyeExam extends StatelessWidget {
  EyeExam({Key? key}) : super(key: key);
  static const routeSymbolW = "/symbolw";

  Widget _bodyWidget(BuildContext ctx) {
    Size size = MediaQuery.of(ctx).size;
    return Stack(
      children: [
        Positioned(
          top: size.height * 0.4 - (size.height * 0.08) - (size.height * 0.12),
          left: size.width * 0.15,
          child: InkWell(
            onTap: () => Navigator.pushNamed(ctx, EyeExam.routeSymbolW),
            highlightColor: Colors.grey.shade300,
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  height: size.height * 0.12,
                  child: Image.asset(
                    "assets/images/symbol_e.png",
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text('Symbol "W"',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.4 - (size.height * 0.08) - (size.height * 0.12),
          left: (size.width * 0.2 * 2) + (size.width * 0.2),
          child: InkWell(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  height: size.height * 0.12,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      "assets/images/symbol_c.png",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text('Symbol "C"',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.67 - (size.height * 0.08) - (size.height * 0.12),
          left: size.width * 0.40,
          child: InkWell(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  height: size.height * 0.12,
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: Image.asset(
                      "assets/images/letter.png",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text('Letters',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.blue.shade100,
            title: const Text(
              "Choose Test Type",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: _bodyWidget(context));
  }
}
