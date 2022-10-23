import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashLoader extends StatefulWidget {
  const SplashLoader({Key? key}) : super(key: key);

  @override
  State<SplashLoader> createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushNamed(context, '/third');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imgs/splash-bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                "PLAYPAL",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Syne',
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  child: SpinKitRing(
                    color: Color(0xffA91079),
                    lineWidth: 5.0,
                    size: 30,
                    duration: Duration(
                      milliseconds: 4000,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
