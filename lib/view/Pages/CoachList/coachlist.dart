import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Coach-Gig-For Player/Coach_gig_view_for_player.dart';

class CoachList extends StatelessWidget {
  const CoachList({super.key});

  @override
  Widget build(BuildContext context) {
    List names = [
      'Ahmed Khan',
      'Hamza Shah',
      'Tipu Shah',
      'Sikandar',
      'Basharat',
      'Mohsin',
      'Usman',
      'Hashim',
      'Usama',
      'Saad',
      'Muqsit',
      'Zohaib',
    ];

    List grounds = [
      'Millat Complex',
      'ARL Ground',
      'KRL Ground',
      'Race Course',
      'F9-park',
      'G-6/11',
      'F7',
      'Koral Ground',
      'Alipur',
      'Lalkurti',
      'Ayub Park',
      'Gulberg Green',
    ];

    List prices = [
      '5000/',
      '6500/',
      '4500/',
      '7000/',
      '5500/',
      '6000/',
      '7500/',
      '3000/',
      '5000/',
      '4500/',
      '5000/',
      '9000/',
    ];

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                          width: width * .10,
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
                          'Coaches',
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
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * .85,
                  height: height * .07,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 88, 6, 88),
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
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Select location',
                                style: GoogleFonts.nunito(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: width * .80,
                  height: height * .06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Results',
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 14),
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * .25,
                            height: height * .04,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 0, 0, 0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sort by',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  FontAwesomeIcons.sort,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowDown,
                            color: Colors.white,
                            size: 15,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowUp,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: width * .89,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 1.5 / 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 15),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Container(
                              width: width * .90,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: width * .40,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.account_circle,
                                                size: 40,
                                              ),
                                              Text(
                                                names[index],
                                                style: GoogleFonts.syne(
                                                    color: Colors.purple,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: width * .35,
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.soccerBall,
                                                color: Colors.purple,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Football',
                                                style: GoogleFonts.syne(
                                                    color: Colors.purple,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: width * .35,
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.locationPin,
                                                color: Color.fromARGB(
                                                    255, 106, 15, 122),
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                grounds[index],
                                                style: GoogleFonts.syne(
                                                    color: Colors.purple,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: width * .35,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'PKR',
                                                style: GoogleFonts.syne(
                                                    color: Colors.purple,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                prices[index],
                                                style: GoogleFonts.syne(
                                                  color: Color.fromARGB(
                                                      255, 38, 3, 44),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'mo',
                                                style: GoogleFonts.syne(
                                                    color: Colors.purple,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CoachGigForPlayer()),
                                            );
                                          },
                                          child: Container(
                                            width: width * .35,
                                            height: height * .05,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    238, 169, 16, 121),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                )),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Hire Me',
                                                  style: GoogleFonts.syne(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_right_alt_outlined,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
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
                ),
                 SizedBox(
                  height: 60,
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
