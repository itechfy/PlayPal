import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/Auth/Login.dart';
import 'package:playpal/view/Pages/Navbar/playerNavbar.dart';

import '../Dashboard/Coach/CoachDashBoard.dart';
import '../Dashboard/Player/playerdashboard.dart';

class ContinueAs extends StatefulWidget {
  const ContinueAs({Key? key}) : super(key: key);

  @override
  State<ContinueAs> createState() => _ContinueAsState();
}

class _ContinueAsState extends State<ContinueAs> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // i
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 6, 95),
                Color.fromARGB(255, 140, 10, 155),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * .85,
                height: height * .05,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: width * .85,
                height: height * .04,
                child: Text(
                  'as',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginWidget(role: 'player')),
                      );
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .30,
                      child: Image.asset(
                        'assets/images/pic4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginWidget(
                                  role: "coaches",
                                )),
                      );
                    },
                    child: Container(
                      width: width * .45,
                      height: height * .30,
                      child: Image.asset(
                        'assets/images/pic5.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
