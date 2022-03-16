import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: size.height * 0.45,
              child: Image.asset("assets/images/login_picture (1).png")),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              // หน้ากล่อง
              SizedBox(
                width: size.width * 0.125,
              ),
              InkWell(
                splashColor: Colors.grey.shade50,
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.12,
                            blurRadius: 0.01)
                      ],
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: (size.width * 0.75) / 7,
                        ),
                        Container(
                            width: size.width * 0.065,
                            child: Image.asset("assets/images/google.png")),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBarSelect()),
              );
            },
            splashColor: Colors.grey,
            child: Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                width: size.width * 0.45,
                child: const Text(
                  "Sign in with Guest",
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade200,
                          spreadRadius: 0.12,
                          blurRadius: 0.01)
                    ],
                    color: Colors.blue.shade200,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(7))),
          )
        ]),
      ),
    );
  }
}
