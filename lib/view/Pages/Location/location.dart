import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Meet-and-Play/meetandplay.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool forLocation = false;
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: width * .85,
                height: height * .09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MeetAndPlay()),
                        );
                      },
                      child: Container(
                        width: width * .12,
                        height: height * .06,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 175, 29, 138),

                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ), //BorderRadius.all
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Location',
                      style: GoogleFonts.nunito(
                          fontSize: 20,
                          color: Color.fromARGB(255, 100, 19, 114),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('Location Access',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 110, 22, 126),
                                  fontSize: 16)),
                        ),
                      ],
                    ),
                    Switch(
                      activeColor: Color.fromARGB(255, 202, 59, 228),
                      activeTrackColor: Color.fromARGB(255, 194, 52, 219),
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 30.0,
                      value: forLocation,
                      //using set state here here for notifications toggle switch
                      onChanged: (value) => setState(() => forLocation = value),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: width * .85,
                  child: Text(
                    'Select City',
                    style: GoogleFonts.nunito(fontSize: 16, color: Colors.grey),
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Rawalpindi',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Islamabad',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: width * .85,
                  child: Text(
                    'Select District',
                    style: GoogleFonts.nunito(fontSize: 16, color: Colors.grey),
                  )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Chaklala Scheme',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Lalkurti',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Tipu Road',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * .85,
                child: Text(
                  'Gulistan Colony',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
                indent: 28,
                endIndent: 25,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width * .85,
                height: height * .09,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 175, 29, 138),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm Location',
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
