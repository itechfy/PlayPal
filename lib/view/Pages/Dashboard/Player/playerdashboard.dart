import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/view/Pages/ContinueAs/continueas.dart';
import 'package:playpal/view/Pages/My-Bookings/mybookings.dart';
import 'package:playpal/view/Pages/My-Teams/my_teams.dart';
import 'package:playpal/view/Pages/Teams-Joined/teams_joined.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/user_provider.dart';
import '../../CoachList/coachlist.dart';
import '../../Favourites/myfavouritegrounds.dart';
import '../../GroundList/GroundList.dart';
import '../../Meet-and-Play/meetandplay.dart';
import '../../Notifications/notifications.dart';
import '../../Team/createteam.dart';
// import 'package:playpal/GroundList.dart';
// import 'package:playpal/coachlist.dart';
// import 'package:playpal/createteam.dart';
// import 'package:playpal/groundinfo.dart';
// import 'package:playpal/myfavouritegrounds.dart';
// import 'package:playpal/notifications.dart';
// import 'meetandplay.dart';

class PlayerDashboard extends StatefulWidget {
  const PlayerDashboard({Key? key}) : super(key: key);

  @override
  State<PlayerDashboard> createState() => _PlayerDashboardState();
}

class _PlayerDashboardState extends State<PlayerDashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 80, 6, 95),
                    Color.fromARGB(255, 39, 2, 63),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Container(
                width: width * .10,
                height: height * .05,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/chotalogo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBookings()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.sports_soccer_outlined,
                  color: Colors.purple,
                ),
                title: Text(
                  'My Bookings',
                  style: GoogleFonts.syne(color: Colors.purple, fontSize: 15),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTeams()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.group_add_outlined,
                  color: Colors.purple,
                ),
                title: Text('My Teams',
                    style:
                        GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.purple,
              ),
              title: Text('Settings',
                  style: GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
            ),
            Divider(
              color: Colors.purple,
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<UserProvider>(context, listen: false)
                    .SignOut()
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => ContinueAs()),
                        (route) => false));
              },
              child: ListTile(
                leading: Icon(
                  Icons.door_back_door_outlined,
                  color: Colors.purple,
                ),
                title: Text('Sign out',
                    style:
                        GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: width * .85,
                  height: height * .06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Drawer()),
                              );
                            },
                            child: Container(
                              width: width * .13,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: Color.fromARGB(255, 58, 6, 88),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color.fromARGB(171, 131, 27, 79)
                                //         .withOpacity(0.5),
                                //     spreadRadius: 2,
                                //     blurRadius: 2,
                                //     offset: Offset(0, 2), // changes position of shadow
                                //   ),
                                // ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${Provider.of<UserProvider>(context, listen: false).user!.displayName ?? ''}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications()),
                          );
                        },
                        child: Icon(
                          Icons.notifications,
                          // FontAwesomeIcons.bell,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: width * .90,
                  height: height * .14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * .13,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Colors.grey,

                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ), //BorderRadius.all
                            ),
                            child: Icon(
                              FontAwesomeIcons.gear,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyFavouriteGrounds()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * .13,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.purple,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Saved',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeamsJoined()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * .13,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                FontAwesomeIcons.users,
                                color: Colors.purple,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Teams',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const CoachList()),
                          // );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * .13,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                FontAwesomeIcons.person,
                                color: Colors.purple,
                                size: 28,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'My Coach',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Create_Team()),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * .13,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.pink,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'New Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeetAndPlay()),
                      );
                    },
                    child: Container(
                      width: width * 90,
                      height: height * .28,
                      child: Image.asset("assets/images/pic2.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GroundList()),
                    );
                  },
                  child: Container(
                    width: width * .88,
                    height: height * .18,
                    child:
                        Image.asset("assets/images/pic.png", fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoachList()),
                    );
                  },
                  child: Container(
                    width: width * .88,
                    height: height * .18,
                    child:
                        Image.asset("assets/images/pic3.png", fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
