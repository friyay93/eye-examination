import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/eye_exam.dart';
import 'package:eye_examination/google_signin_provider.dart';
import 'package:eye_examination/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class About extends StatefulWidget {
  static const routeName = "/logout";

  About({Key? key}) : super(key: key);
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isTouch = false;
  List information = [
    {"text": "Help", "icon": Icons.help, "navigate": ""},
    {"text": "FeedBack", "icon": Icons.mail, "navigate": BottomBarSelect()},
    {
      "text": "Term of Use",
      "icon": Icons.question_answer_outlined,
      "navigate": EyeExam()
    },
    {
      "text": "About Us",
      "icon": Icons.medication_liquid_sharp,
      "navigate": BottomBarSelect()
    },
    {"text": "LogOut", "icon": Icons.logout, "navigate": BottomBarSelect()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue.shade100,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              "About",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 44, bottom: 7),
              child: Text(
                "INFORMATION",
                style: TextStyle(fontSize: 11, color: Colors.grey),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: information.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: information[index]['text'] == "LogOut"
                          ? () {
                              if (FirebaseAuth.instance.currentUser == null) {
                                Navigator.pushNamed(context, About.routeName);
                              } else {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.logout();
                                Navigator.pushNamed(context, About.routeName);
                              }
                            }
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          information[index]['navigate']));
                            },
                      splashColor: Colors.grey.shade50,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: index != 0
                                  ? BorderSide(
                                      width: 1.0, color: Colors.grey.shade400)
                                  : const BorderSide(color: Colors.white)),
                        ),
                        padding: const EdgeInsets.all(14),
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 7,
                            ),
                            Icon(information[index]['icon']),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${information[index]['text']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Icon(Icons.navigate_next,
                                color: Colors.grey.shade400)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

// Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 44, bottom: 7),
//             child: Text(
//               "INFORMATION",
//               style: TextStyle(fontSize: 11, color: Colors.grey),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           InkWell(
//             onTap: () => print("Hello world"),
//             splashColor: Colors.grey.shade50,
//             // borderRadius: BorderRadius.all(),
//             child: Container(
//               padding: const EdgeInsets.all(14),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   const Icon(Icons.help),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "Help",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.navigate_next, color: Colors.grey.shade400)
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () => print("Hello world"),
//             splashColor: Colors.grey.shade50,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border(
//                     top: BorderSide(width: 1.0, color: Colors.grey.shade400)),
//               ),
//               padding: const EdgeInsets.all(14),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   const Icon(Icons.mail),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "FeedBack",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.navigate_next, color: Colors.grey.shade400)
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () => print("Hello world"),
//             splashColor: Colors.grey.shade50,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border(
//                     top: BorderSide(width: 1.0, color: Colors.grey.shade400)),
//               ),
//               padding: const EdgeInsets.all(14),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   const Icon(Icons.question_answer_outlined),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "Term of Use",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.navigate_next, color: Colors.grey.shade400)
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () => print("Hello world"),
//             splashColor: Colors.grey.shade50,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border(
//                     top: BorderSide(width: 1.0, color: Colors.grey.shade400)),
//               ),
//               padding: const EdgeInsets.all(14),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   const Icon(Icons.medication_outlined),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "About",
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.navigate_next, color: Colors.grey.shade400)
//                 ],
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   height: 20,
//           // ),
//           InkWell(
//             onTap: () {
//               final provider =
//                   Provider.of<GoogleSignInProvider>(context, listen: false);
//               provider.logout();
//             },
//             splashColor: Colors.red,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: isTouch ? Colors.grey.shade300 : Colors.white,
//                 border: Border(
//                     top: BorderSide(width: 1.0, color: Colors.grey.shade400)),
//               ),
//               padding: const EdgeInsets.all(14),
//               // color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   const Icon(Icons.logout),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Text(
//                     "LogOut",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.navigate_next, color: Colors.grey.shade400)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
