import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/models/Bookings/bookings.model.dart';
import 'package:playpal/services/booking.services.dart';
import 'package:provider/provider.dart';

import '../../../view_model/user_provider.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  List<Bookings>? _bookings;
  @override
  void initState() {
    BookingService.getMyBookings(
            Provider.of<UserProvider>(context, listen: false).user?.uid)
        .then((value) => {
              setState(() => {this._bookings = value}),
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

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
                        'Reservations',
                        style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
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
                    style: GoogleFonts.syne(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: width * .85,
                  child: Text(
                    'Bookings',
                    style: GoogleFonts.syne(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: _bookings?.length ?? 0,
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
                                    Text(
                                      '${_bookings?[index].name ?? ""}',
                                      style: GoogleFonts.syne(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
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
                                              '${_bookings?[index].location ?? ""}',
                                              style: GoogleFonts.syne(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '  PKR/-',
                                              style: GoogleFonts.syne(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${_bookings?[index].price}',
                                              style: GoogleFonts.syne(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: width * .60,
                                          height: height * .04,
                                          decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${_bookings?[index].slots[0]}',
                                                style: GoogleFonts.syne(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
