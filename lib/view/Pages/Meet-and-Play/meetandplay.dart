import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Location/location.dart';

class MeetAndPlay extends StatefulWidget {
  const MeetAndPlay({Key? key}) : super(key: key);

  @override
  State<MeetAndPlay> createState() => _MeetAndPlayState();
}

class _MeetAndPlayState extends State<MeetAndPlay> {
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
  List ratings = [
    '4.5',
    '4.8',
    '3.8',
    '4.6',
    '4.2',
    '4',
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
                          'Available Teams',
                          style: GoogleFonts.syne(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: width * .15,
                        height: height * .07,
                        decoration: BoxDecoration(
                          color: Colors.pink,
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
                          Icons.sports_soccer,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: width * .16,
                        height: height * .08,
                        decoration: BoxDecoration(
                          color: Colors.black26,
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
                          Icons.sports_cricket,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .90,
                  child: Text(
                    'Find the Team',
                    style: GoogleFonts.syne(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Location()),
                    );
                  },
                  child: Container(
                    width: width * .90,
                    height: height * .08,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 192, 19, 106).withOpacity(0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          FontAwesomeIcons.locationPin,
                          color: Colors.pink,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Select Location',
                          style: GoogleFonts.syne(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .90,
                  child: Text(
                    'Showing Results',
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
                        itemCount: 6,
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
                                          Icon(FontAwesomeIcons.soccerBall),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            teams[index],
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: width * .35,
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
                                                          fontSize: 13),
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
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.yellow,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            ratings[index],
                                            style: GoogleFonts.syne(
                                              color: Colors.purple,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
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
                                        width: width * .30,
                                        height: height * .06,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 192, 19, 106),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Challenge',
                                              style: GoogleFonts.syne(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.boltLightning,
                                              color: Colors.white,
                                              size: 15,
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
