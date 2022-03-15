import 'package:eye_examination/addcase_screen.dart';
import 'package:eye_examination/bottom_bar.dart';
import 'package:eye_examination/google_signin_provider.dart';
import 'package:eye_examination/manage.dart';
import 'package:eye_examination/more.dart';
import 'package:eye_examination/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
         
        ),
      );
}
