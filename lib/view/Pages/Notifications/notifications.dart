import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/view/Pages/Navbar/playerNavbar.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayerNavbar()),
                    );
                  },
                  child: Container(
                    width: width * .85,
                    height: height * .09,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
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
                        SizedBox(
                          width: 15,
                        ),
                        Text('Notifications',
                            style: TextStyle(
                              color: Color.fromARGB(255, 156, 23, 101),
                              fontFamily: 'Syne',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .85,
                  child: Text('Today',
                      style: TextStyle(
                        color: Color.fromARGB(255, 156, 23, 101),
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .85,
                  child: Text('Yesterday',
                      style: TextStyle(
                        color: Color.fromARGB(255, 156, 23, 101),
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .85,
                  child: Text('July 25, 2022',
                      style: TextStyle(
                        color: Color.fromARGB(255, 156, 23, 101),
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * .85,
                  height: height * .08,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .12,
                            height: height * .06,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 197, 197, 197),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('New Request',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Roy Palmer Wants To Join Your Team.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Syne',
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
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
