import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/Navbar/coachNavbar.dart';

import '../Coach-gig-successfully-created/coach_gig_created_sucessfully.dart';

class CreateGig extends StatefulWidget {
  const CreateGig({Key? key}) : super(key: key);

  @override
  State<CreateGig> createState() => _CreateGigState();
}

class _CreateGigState extends State<CreateGig> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _rolesController = TextEditingController();
    final TextEditingController _teachingController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoachNavbar()),
                    );
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
                          'Create Gig',
                          style: GoogleFonts.syne(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'Enter Title',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: width * .85,
                              height: height * .10,
                              child: TextField(
                                controller: _titleController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.pencil,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 179, 11, 95)
                                        .withOpacity(0.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Enter Your Gig Title",
                                    labelStyle: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'What Do You Teach?',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: width * .85,
                              height: height * .08,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * .40,
                                    height: height * .06,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 179, 11, 95),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Color.fromARGB(255, 107, 13, 145)
                                      //         .withOpacity(0.5),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 7,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ), //BorderRadius.all
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.soccerBall,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Football',
                                          style: GoogleFonts.syne(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width * .40,
                                    height: height * .06,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 58, 6, 88),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Color.fromARGB(255, 179, 11, 95)
                                      //         .withOpacity(0.5),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 7,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ), //BorderRadius.all
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.baseball,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Cricket',
                                          style: GoogleFonts.syne(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'What Are Your Duties?',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: width * .85,
                              height: height * .10,
                              child: TextField(
                                controller: _rolesController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.pencil,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 179, 11, 95)
                                        .withOpacity(0.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Your Roles & Responsibilites...",
                                    labelStyle: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 09)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'What Is Your Teaching Style?',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: width * .85,
                              height: height * .10,
                              child: TextField(
                                controller: _teachingController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.pencil,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 179, 11, 95)
                                        .withOpacity(0.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Your Teaching Style...",
                                    labelStyle: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 09)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'From Where Do You Teach?',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: width * .85,
                              height: height * .10,
                              child: TextField(
                                controller: _locationController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.locationPin,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 179, 11, 95)
                                        .withOpacity(0.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "Enter Your Location",
                                    labelStyle: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 09)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: width * .85,
                              child: Row(
                                children: [
                                  Text(
                                    'Pricing',
                                    style: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: width * .85,
                              height: height * .10,
                              child: TextField(
                                controller: _priceController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.dollarSign,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 179, 11, 95)
                                        .withOpacity(0.5),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText:
                                        "Enter Your Price as Per Month...",
                                    labelStyle: GoogleFonts.syne(
                                        color: Colors.white, fontSize: 09)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CoachGigSuccessfullyDone()),
                                );
                              },
                              child: Container(
                                width: width * .85,
                                height: height * .09,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(164, 233, 30, 98),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Create',
                                        style: GoogleFonts.syne(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.longArrowAltRight,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
