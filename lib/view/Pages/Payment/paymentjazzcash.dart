import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/services/booking.services.dart';

import 'package:playpal/view/Pages/Final-Payment-Ground/final_payment_ground.dart';
import 'package:provider/provider.dart';

import '../../../models/Slot/slot.model.dart';
import '../../../view_model/user_provider.dart';

class PaymentJazzCash extends StatefulWidget {
  final int? rate;
  final String? ownerName;
  final String? groundName;
  final String? myDay;
  final String? gid;
  final Slot? s;
  final String? ownerPhone;

  const PaymentJazzCash(
      {Key? key,
      this.rate,
      this.ownerName,
      this.myDay,
      this.ownerPhone,
      this.groundName,
      this.gid,
      this.s})
      : super(key: key);

  @override
  State<PaymentJazzCash> createState() => _PaymentJazzCashState();
}

class _PaymentJazzCashState extends State<PaymentJazzCash> {
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    isLoading = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width = size.width;
    var height = size.height;
    return Scaffold(
        body: SafeArea(
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
              width: width * .90,
              height: height * .06,
              child: Row(
                children: [
                  Container(
                    width: width * .12,
                    height: height * .05,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 58, 6, 88),

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
                    'Payment',
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
            height: 100,
          ),
          Column(
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Column(
                  children: [
                    Container(
                      width: width * .85,
                      height: height * .50,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ), //BorderRadius.all
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -65,
                            left: 80,
                            child: Column(
                              children: [
                                Container(
                                  width: width * .33,
                                  height: height * .18,
                                  child: Image.asset(
                                    'assets/imgs/tick2.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'PKR- ${widget.rate.toString()}',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  width: width * .40,
                                  height: height * .06,
                                  child: Text(
                                    '${Provider.of<UserProvider>(context, listen: false).user?.displayName ?? ''} to ${widget.ownerName ?? ''}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 156, 26, 139),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                // Text(
                                //   'was sent by',
                                //   style: TextStyle(
                                //     color: Colors.purple,
                                //     fontSize: 12,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${widget.myDay ?? ''}',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Date & Time',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  widget.s?.startTime != ''
                                      ? Text(
                                          '${widget.s?.startTime} - ${widget.s?.closeTime}',
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 14,
                                          ),
                                        )
                                      : Text(
                                          "${widget.s?.slotId}",
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 14,
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Payment Type',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'JazzCash',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Owner phone number',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${widget.ownerPhone ?? ''}',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              await BookingService.payNow(widget.ownerPhone, widget.rate)
                  .then((value) => {
                        isLoading = false,
                        // Store booking in firebase
                        BookingService.bookAGround(
                                widget.gid,
                                widget.myDay,
                                widget.s?.slotId,
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .user
                                    ?.uid)
                            .then((value2) => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FinalPaymentGround(
                                              rate: widget.rate,
                                              t: value,
                                              groundName: widget.groundName,
                                              date: widget.myDay,
                                            )),
                                  )
                                })
                      });
              setState(() {
                isLoading = false;
              });
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color.fromARGB(0, 255, 255, 255),
                  ],
                ),
              ),
              child: Container(
                width: width * .90,
                height: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF570A57),
                      Color(0xFFF806CC),
                    ],
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      isLoading == true
                          ? "Loading..."
                          : "Continue with JazzCash",
                      style:
                          GoogleFonts.syne(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
