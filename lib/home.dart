import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName1 = "/eyeExam";
  static const routeName2 = "/colorBlindForm";
  static const routeName3 = "/eyeDry";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.06,
              child: const Text(
                "Csheep",
                style: TextStyle(
                    color: Color.fromRGBO(107, 214, 238, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              top: size.height * 0.099,
              left: size.width * 0.08,
              child: _user != null
                  ? Text(
                      "Hi ${_user.displayName}!",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.2,
                          fontWeight: FontWeight.w400),
                    )
                  : const Text(
                      "Hi Guest!",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.2,
                          fontWeight: FontWeight.w400),
                    ),
            ),
            Positioned(
              height: size.height * 0.17,
              right: size.width * 0.06,
              child: SizedBox(
                width: 50,
                child: Image.asset("assets/images/sheep_splash.png"),
              ),
            ),
            Positioned(
              top: size.height * 0.15,
              left: size.width * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/under_bar.jpg",
                  fit: BoxFit.cover,
                  width: 320,
                  height: 136,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              left: size.width * 0.09,
              child: const Text(
                "Choose Your test .. ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: size.height * 0.46,
              width: 320,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Home.routeName3),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(238, 247, 249, 1)),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Dry Eye",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: Image.asset("assets/images/eyedry_icon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.61,
              width: 320,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Home.routeName1),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(238, 247, 249, 1)),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Eye Exam",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: Image.asset("assets/images/eye-exam.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.76,
              width: 320,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Home.routeName2),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(238, 247, 249, 1)),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Color Blind",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30,
                        child: Image.asset("assets/images/color-blind.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ); //
  }
}
