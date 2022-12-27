import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:playpal/view/Pages/Dashboard/Player/playerdashboard.dart';

class MyFavouriteGrounds extends StatefulWidget {
  const MyFavouriteGrounds({Key? key}) : super(key: key);

  @override
  State<MyFavouriteGrounds> createState() => _MyFavouriteGroundsState();
}

class _MyFavouriteGroundsState extends State<MyFavouriteGrounds> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    var isLiked = false;

    List area = [
      'ARL Ground',
      'KRL Ground',
      'Race Course',
      'F9-park',
      'G-6/11',
      'F7',
    ];

    List names = [
      'Falcon Ground',
      'Midfield Ground',
      'Race Course Ground',
      'F9-Ground',
      'Shaheen Complex',
      'Janbaz Sports Ground',
    ];

    List price = [
      '5,000',
      '8,000',
      '12,000',
      '10,000',
      '4500',
      '5,000',
    ];

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
                Container(
                  width: width * .85,
                  height: height * .09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                        'Saved',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .85,
                  child: Text(
                    'My',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: width * .85,
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width * .90,
                            height: height * .15,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 41, 6, 41),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: width * .21,
                                  height: height * .10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.pink,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * .62,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            names[index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Syne',
                                              fontSize: 16,
                                            ),
                                          ),
                                          LikeButton(
                                            size: 25,
                                            isLiked: isLiked,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.locationPin,
                                          color: Colors.purple,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          area[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Syne',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'RS',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Syne',
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          price[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Syne',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
