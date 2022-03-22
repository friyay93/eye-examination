import 'package:camera/camera.dart';
import 'package:eye_examination/addcase_screen.dart';
import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/color_blind_form.dart';
import 'package:eye_examination/color_blind_instruction.dart';
import 'package:eye_examination/color_blind_result.dart';
import 'package:eye_examination/color_blind_test.dart';
import 'package:eye_examination/dummy.dart';
import 'package:eye_examination/dummy2.dart';
import 'package:eye_examination/dummy3.dart';
import 'package:eye_examination/eye_dry.dart';
import 'package:eye_examination/eye_exam.dart';
import 'package:eye_examination/google_signin_provider.dart';
import 'package:eye_examination/manage.dart';
import 'package:eye_examination/about.dart';
import 'package:eye_examination/symbol_e.dart';
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
          title: "Eye Dectection",
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.blue.shade100,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: AnimatedSplashScreen(
              duration: 1500,
              splash: Image.asset("assets/images/sheep_splash.png"),
              curve: Curves.ease,
              nextScreen: HomePageManage(),
              splashTransition: SplashTransition.rotationTransition,
              // pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.blue.shade100),
          //initialRoute: "/",
          routes: {
            AddCaseScreen.routeName1: (context) => EyeExam(),
            AddCaseScreen.routeName2: (context) => ColorBlindInstruction(),
            AddCaseScreen.routeName3: (context) => EyeDry(),
            ColorBlindForm.routeName: (context) => ColorBlindTest(),
            ColorBlindInstruction.routeName: (context) => ColorBlindForm(),
            ColorBlindResult.routeName: (context) => BottomBarSelect(),

            // more route
            About.routeName: (context) => HomePageManage(),

            // eye exam
            EyeExam.routeSymbolW: (context) => SymbolE(),

            // eye dry
            EyeDry.routeName: (context) => Dummy1(),
            // test dummy
            Dummy1.routeName: (context) => EyeDry(),
            Dummy2.routeName: (context) => EyeDry(),
            Dummy3.routeName: (context) => EyeDry()
          },
        ),
      );
}
