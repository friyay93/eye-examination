import 'package:camera/camera.dart';
import 'package:eye_examination/dry%20eye/dry_eye_question.dart';
import 'package:eye_examination/home.dart';
import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/color%20blind/color_blind_instruction.dart';
import 'package:eye_examination/color%20blind/color_blind_result.dart';
import 'package:eye_examination/color%20blind/color_blind_test.dart';
import 'package:eye_examination/dry%20eye/dry_eye_test.dart';
import 'package:eye_examination/eye%20exam/eye_exam.dart';
import 'package:eye_examination/google_signin_provider.dart';
import 'package:eye_examination/manage.dart';
import 'package:eye_examination/about.dart';
import 'package:eye_examination/eye%20exam/eye_exam_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (ctx) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Eye Dectection",
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.blue.shade100,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: AnimatedSplashScreen(
              duration: 1000,
              splash: Image.asset("assets/images/sheep_splash.png"),
              curve: Curves.ease,
              nextScreen: HomePageManage(),
              splashTransition: SplashTransition.rotationTransition,
              // pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.blue.shade100),
          //initialRoute: "/",
          routes: {
            Home.routeName1: (context) => EyeExam(),
            Home.routeName2: (context) => ColorBlindInstruction(),
            Home.routeName3: (context) => const DryEyeTest(),
            ColorBlindForm.routeName: (context) => ColorBlindTest(),
            ColorBlindResult.routeName: (context) => BottomBarSelect(),

            // more route
            About.routeName: (context) => HomePageManage(),
            // eye exam
            EyeExam.routeSymbolW: (context) => EyeExamTest(),
          },
        ),
      );
}
