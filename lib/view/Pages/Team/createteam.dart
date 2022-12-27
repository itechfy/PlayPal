// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unused_local_variable, camel_case_types, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/Navbar/playerNavbar.dart';

class Create_Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List ages = ['13', '16', '17', '18', '19', '21', '22'];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // ignore: prefer_const_constructors
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
                              builder: (context) => const PlayerNavbar()),
                        );
                      },
                      child: Container(
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
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Create Your Team',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width * .85,
                height: height * .08,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontSize: 16,
                            ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontSize: 16,
                            ),
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
                      'Team Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: width * .85,
                height: height * .10,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.pencil,
                        size: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 179, 11, 95).withOpacity(0.5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Inzuma 11",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      )),
                ),
              ),
              Container(
                width: width * .85,
                child: Row(
                  children: [
                    Text(
                      'Team Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: width * .85,
                height: height * .09,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.locationPin,
                        size: 18,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 179, 11, 95).withOpacity(0.5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Pakistan Town etc...",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      )),
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
                      'Age Category Under...',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: width * .85,
                height: height * .09,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) => Container(
                    width: width * .15,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 179, 11, 95).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        ages[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width * .85,
                child: Row(
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width * .85,
                height: height * .15,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   FontAwesomeIcons.locationPin,
                      //   size: 12,
                      //   color: Colors.white,
                      // ),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 179, 11, 95).withOpacity(0.5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Pakistan Town etc...",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 16,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
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
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontSize: 16,
                        ),
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
            ],
          ),
        ),
      )),
    );
  }
}
