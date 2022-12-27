import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:playpal/view/Pages/Teams-Joined/teams_joined.dart';

class MyTeams extends StatefulWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  State<MyTeams> createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  List teams = [
    'Inzuma 11',
    'Falcons 23',
    'Flamings 84',
    'Ajizi 11',
    'Gulistan 786',
    'Bari 333',
  ];

  List wins = [
    '4 wins',
    '12 wins',
    '1 wins',
    '23 wins',
    '2 wins',
    '6 wins',
  ];

  List city = [
    'Islamabad',
    'Rawalpindi',
    'Islamabad',
    'Islamabad',
    'Rawalpindi',
    'Rawalpindi',
  ];

  List area = ['F-10', 'Ayub Park', 'F-7', 'G-6', 'Race Course', 'Marir'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
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
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width * .85,
                    height: height * .09,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width * .12,
                              height: height * .05,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 58, 6, 88),
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
                                  Radius.circular(10),
                                ), //BorderRadius.all
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Teams',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.users,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Requests',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .90,
                  height: height * .08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Color.fromARGB(255, 192, 19, 106).withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: width * .40,
                            height: height * .07,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TeamsJoined()),
                                    );
                                  },
                                  child: Text(
                                    'Joined Teams',
                                    style: GoogleFonts.syne(
                                        color:
                                            Color.fromARGB(255, 192, 19, 106),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * .45,
                        height: height * .07,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 19, 106),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'My  Teams',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .90,
                  child: Text(
                    'Total Teams',
                    style: GoogleFonts.syne(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: width * .90,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width * .90,
                            height: height * .20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * .80,
                                  height: height * .06,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.sports_cricket),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            teams[index],
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width * .80,
                                  height: height * .04,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.person,
                                            color: Colors.purple,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            '10/12',
                                            style: GoogleFonts.syne(
                                              color: Colors.purple,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.medal,
                                            color: Colors.yellow,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            wins[index],
                                            style: GoogleFonts.syne(
                                              color: Colors.purple,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * .80,
                                  height: height * .07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.locationPin,
                                            color: Colors.purple,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            city[index],
                                            style: GoogleFonts.syne(
                                              color: Colors.purple,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            area[index],
                                            style: GoogleFonts.syne(
                                              color: Colors.purple,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: width * .33,
                                        height: height * .06,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors.black,
                                                  child: Icon(
                                                    FontAwesomeIcons.user,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 20,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      FontAwesomeIcons.user,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 40,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        Colors.purple,
                                                    child: Icon(
                                                      FontAwesomeIcons.user,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 60,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        Colors.blue,
                                                    child: Icon(
                                                      FontAwesomeIcons.user,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 80,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: Text(
                                                      '+6',
                                                      style: GoogleFonts.syne(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
