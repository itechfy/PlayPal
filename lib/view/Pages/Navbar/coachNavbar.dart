import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/Coach-gig-edit/coachgig.dart';
import 'package:playpal/view/Pages/My-Gig/mygig.dart';
import 'package:playpal/view/Pages/Profile-coach/profile_coach.dart';

import '../Dashboard/Coach/CoachDashBoard.dart';
import '../Inbox/inbox.dart';
import '../Payments/payments.dart';
import '../Profile/profile.dart';

class CoachNavbar extends StatefulWidget {
  const CoachNavbar({Key? key}) : super(key: key);

  @override
  State<CoachNavbar> createState() => _CoachNavbarState();
}

class _CoachNavbarState extends State<CoachNavbar> {
  int currentIndex = 0;
  final screens = [];
  // final screens = [
  //    CoachDashboard(),
  //   Inbox(),
  //   Payments(),
  //   Profile(),
  // ];
  _CoachNavbarState() {
    screens.insert(0, CoachDashboard());
    screens.insert(1, MyGig());
    screens.insert(2, Payments());
    screens.insert(3, ProfileCoach());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        width: width * 1,
        height: height * .10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 80, 6, 95),
              Color.fromARGB(255, 39, 2, 63),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          // backgroundColor: Color.fromARGB(255, 92, 20, 89),
          iconSize: 18,
          selectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.edit),
              label: ('My Gig'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.creditCard),
              label: ('Payments'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: ('Profile'),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
