import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/Dashboard/Coach/CoachDashBoard.dart';
import 'package:playpal/view/Pages/Navbar/coachNavbar.dart';

class CoachGigSuccessfullyDone extends StatefulWidget {
  const CoachGigSuccessfullyDone({Key? key}) : super(key: key);

  @override
  State<CoachGigSuccessfullyDone> createState() =>
      _GroundBookingSuccessfullyDoneState();
}

class _GroundBookingSuccessfullyDoneState
    extends State<CoachGigSuccessfullyDone> {
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
              Color.fromARGB(255, 80, 6, 95),
              Color.fromARGB(255, 39, 2, 63),
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
              width: width * .40,
              height: height * .18,
              child: Image.asset(
                'assets/images/tick.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Gig Created !',
              style: GoogleFonts.syne(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoachNavbar()),
                );
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                  ),
                ),
                child: Container(
                  width: width * .90,
                  height: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF570A57),
                        Color(0xFFF806CC),
                      ],
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Back To Main",
                        style:
                            GoogleFonts.syne(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
