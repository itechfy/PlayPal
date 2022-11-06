import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/AccessLocation/Location_access.dart';
import 'package:playpal/view/Pages/GroundList/GroundList.dart';
import 'package:playpal/view/pages/Splash/splash.dart';
import 'package:playpal/view/Pages/Loaders/splash_loader.dart';
import 'package:playpal/view/pages/Auth/Login.dart';
import 'package:playpal/view/pages/Auth/Signup.dart';
import 'package:playpal/view/pages/onboarding/views/onboarding_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchScreen(),
        '/onboard': (context) => const OnBoardingScreen(),
        '/second': (context) => const SplashLoader(),
        '/third': (context) => const Splash(),
        '/signup': (context) => const SignUpWidget(),
        '/signin': (context) => const LoginWidget(),
        //'/otp': (context) => const OTP(),
        '/access': (context) => const LocationAccess(),
        '/grounds': (context) => const GroundList(),
      },
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    Timer(const Duration(seconds: 3),
        () => {Navigator.pushNamed(context, '/onboard')});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF570A57),
      child: Image.asset('assets/imgs/launchLogo.png'),
    );
  }
}
