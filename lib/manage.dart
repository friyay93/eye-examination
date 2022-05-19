import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // snapshot บอก status ของข้อมูลว่าสำเร็จหรือไม่
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong "),
          );
        } else if (snapshot.hasData) {
          return BottomBarSelect();
        }
        return const SignInScreen();
      },
    );
  }
}
