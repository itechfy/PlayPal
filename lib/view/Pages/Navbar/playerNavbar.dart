import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/My-Bookings/mybookings.dart';
import 'package:playpal/view/Pages/Profile-player/profile_player.dart';
import 'package:playpal/view_model/user_provider.dart';
import 'package:provider/provider.dart';

import '../Dashboard/Player/playerdashboard.dart';
import '../Inbox/inbox.dart';
import '../Payments/payments.dart';
import '../Profile/profile.dart';

class PlayerNavbar extends StatefulWidget {
  const PlayerNavbar({Key? key}) : super(key: key);

  @override
  State<PlayerNavbar> createState() => _PlayerNavbarState();
}

class _PlayerNavbarState extends State<PlayerNavbar> {
  int currentIndex = 0;
  final screens = [];
  _PlayerNavbarState() {
    //sending user in player dashboard
    screens.insert(0, PlayerDashboard());
    screens.insert(1, MyBookings());
    screens.insert(2, Payments());
    screens.insert(3, ProfilePlayer());
  }
  @override
  void initState() {
    print(Provider.of<UserProvider>(context, listen: false).user!.displayName);
    super.initState();
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
          iconSize: 22,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.book),
              label: ('Mybookings'),
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
