import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playpal/models/Transaction/transaction.model.dart';
import 'package:playpal/view/Pages/Ground-Booking-Successfully-Done/ground_booking_successfully_done.dart';
import 'package:provider/provider.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../view_model/user_provider.dart';

class FinalPaymentGround extends StatefulWidget {
  final Transaction? t;
  final String? groundName;
  final String? date;
  final int? rate;
  const FinalPaymentGround(
      {Key? key, this.t, this.groundName, this.rate, this.date})
      : super(key: key);

  @override
  State<FinalPaymentGround> createState() => _FinalPaymentGroundState();
}

class _FinalPaymentGroundState extends State<FinalPaymentGround> {
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
            child: Column(
              children: [
                SizedBox(
                  height: 15,
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
                          height: height * .06,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 175, 29, 138),

                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
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
                          'Confirm Payment',
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Color.fromARGB(255, 100, 19, 114),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                TicketWidget(
                  width: 350,
                  height: 570,
                  color: Color.fromARGB(255, 87, 10, 87),
                  isCornerRounded: true,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .30,
                        height: height * .15,
                        child: Image.asset(
                          'assets/imgs/launchLogo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Ground',
                              style: GoogleFonts.syne(
                                  color: Colors.white38, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.groundName ?? "No ground name"}',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Duration',
                              style: GoogleFonts.syne(
                                  color: Colors.white38, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'From ${widget.date ?? "00-00-0000"}',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction ID',
                              style: GoogleFonts.syne(
                                  color: Colors.white38, fontSize: 12),
                            ),
                            Text(
                              '${widget.t?.ppTxnRefNo ?? "XXXXXXXX"}',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: width * .70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Grand Total',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              'RS/-${widget.rate ?? "00"}',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Name',
                              style: GoogleFonts.syne(
                                  color: Colors.white38, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${Provider.of<UserProvider>(context, listen: false).user?.displayName ?? "No name"}',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Payment Through',
                              style: GoogleFonts.syne(
                                  color: Colors.white38, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width * .75,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Jazzcash',
                              style: GoogleFonts.syne(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width * .50,
                        height: height * .06,
                        child: Image.asset(
                          'assets/imgs/barcode.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GroundBookingSuccessfullyDone()),
                        );
                      },
                      child: Container(
                        width: width * .85,
                        height: height * .07,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 87, 10, 87),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CHECKOUT',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              FontAwesomeIcons.longArrowAltRight,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
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
