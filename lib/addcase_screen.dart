import 'package:flutter/material.dart';
import './color_blind_form.dart';
import './eye_exam.dart';

class AddCaseScreen extends StatelessWidget {
  static const routeName1 = "/eyeExam";
  static const routeName2 = "/colorBlindForm";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: ()
                    // {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => EyeExam()),
                    //   );
                    // },
                    {
                  // push to eyeexam
                  Navigator.pushNamed(context, AddCaseScreen.routeName1);
                },
                icon: const Text(
                  "Pupil Dectection",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 17.5,
                      color: Colors.black),
                ),
                label: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 70,
                  color: Colors.blue.shade300,
                ),
                style: const ButtonStyle(alignment: Alignment.center),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           ColorBlindForm()), // transactions = public
                  // );
                  Navigator.pushNamed(context, AddCaseScreen.routeName2);
                },
                icon: const Text(
                  "Color Blind",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 17.5),
                ),
                label: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 70,
                  color: Colors.blue.shade300,
                ),
                style: const ButtonStyle(alignment: Alignment.center),
              ),
            ),
          ],
        )
      ],
    );
  }
}




// Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 color: Colors.yellow,
//                 width: size.width * 0.35,
//                 height: size.height * 0.2,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.09,
//                     ),
//                     Text(
//                       "Eye Exam",
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               width: size.width * 0.1,
//             ),
//             Container(
//                 color: Colors.yellow,
//                 width: size.width * 0.35,
//                 height: size.height * 0.2,
//                 child: Text(
//                   "Eye Exam",
//                   textAlign: TextAlign.center,
//                 )),
//           ],
//         )