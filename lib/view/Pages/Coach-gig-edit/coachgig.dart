import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoachGig extends StatefulWidget {
  const CoachGig({Key? key}) : super(key: key);

  @override
  State<CoachGig> createState() => _CoachGigState();
}

class _CoachGigState extends State<CoachGig> {
  int _value = 1;
  String title = "I will be your FootBall Coach";
  String duties = "Coordinate, Instruct, Motivate and Organize teams";
  bool isEditable = false;
  bool editDuty = false;
  String venue = "G-6 Islamabad";
  bool editVenue = false;
  String price = "RS 8000";
  bool editPrice = false;

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
                Container(
                  width: width * 1,
                  height: height * .40,
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
                                'My Gig',
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
                        width: width * .25,
                        height: height * .12,
                        decoration: BoxDecoration(
                          color: Colors.pink,

                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ), //BorderRadius.all
                        ),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hamza Shah',
                        style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: width * .90,
                        child: Row(
                          children: [
                            Text(
                              'MY GIG',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: height * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .92,
                            height: height * .06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: !isEditable
                                        ? Text(
                                            title,
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 16),
                                          )
                                        : TextFormField(
                                            initialValue: title,
                                            textInputAction:
                                                TextInputAction.done,
                                            autofocus: true,
                                            onFieldSubmitted: (value) {
                                              setState(() => {
                                                    isEditable = false,
                                                    title = value
                                                  });
                                            })),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.purple,
                                  ),
                                  onPressed: () {
                                    setState(() => {
                                          isEditable = true,
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.purple,
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: width * .90,
                                        height: height * .40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            )),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: width * .15,
                                              height: height * .01,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            Container(
                                              width: width * .85,
                                              child: Text(
                                                'Which Sports Do You Teach?',
                                                style: GoogleFonts.syne(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                RadioListTile(
                                                  value: 1,
                                                  groupValue: _value,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = _value;
                                                    });
                                                  },
                                                  activeColor: Colors.purple,
                                                  title: Text(
                                                    'Cricket',
                                                    style: GoogleFonts.syne(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  value: 2,
                                                  groupValue: 2,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = _value;
                                                    });
                                                  },
                                                  activeColor: Colors.purple,
                                                  title: Text(
                                                    'Football',
                                                    style: GoogleFonts.syne(
                                                        fontSize: 16),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: width * .90,
                              height: height * .06,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'FootBall Coach',
                                    style: GoogleFonts.syne(
                                        color: Colors.purple, fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black38,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.purple,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .90,
                            child: Text(
                              'Duties',
                              style: GoogleFonts.syne(
                                  color: Colors.purple, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .92,
                            height: height * .06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: !editDuty
                                        ? Text(
                                            duties,
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 16),
                                          )
                                        : TextFormField(
                                            initialValue: duties,
                                            textInputAction:
                                                TextInputAction.done,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              setState(() => {
                                                    editDuty = false,
                                                    duties = value
                                                  });
                                            })),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.purple,
                                  ),
                                  onPressed: () {
                                    setState(() => {
                                          editDuty = true,
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.purple,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: width * .90,
                                        height: height * .40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            )),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: width * .15,
                                              height: height * .01,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            Container(
                                              width: width * .85,
                                              child: Text(
                                                'How Do you Teach Students?',
                                                style: GoogleFonts.syne(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                RadioListTile(
                                                  value: 1,
                                                  groupValue: _value,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = _value;
                                                    });
                                                  },
                                                  activeColor: Colors.purple,
                                                  title: Text(
                                                    'Instruct',
                                                    style: GoogleFonts.syne(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  value: 2,
                                                  groupValue: 2,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = _value;
                                                    });
                                                  },
                                                  activeColor: Colors.purple,
                                                  title: Text(
                                                    'Coordinate and Organize Teams',
                                                    style: GoogleFonts.syne(
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                RadioListTile(
                                                  value: 3,
                                                  groupValue: 3,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _value = _value;
                                                    });
                                                  },
                                                  activeColor: Colors.purple,
                                                  title: Text(
                                                    'Motivate',
                                                    style: GoogleFonts.syne(
                                                        fontSize: 16),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: width * .90,
                              height: height * .08,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Level Of Teaching',
                                        style: GoogleFonts.syne(
                                            color: Colors.purple, fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black38,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: width * .90,
                                    child: Text(
                                      'Coordinate, Instruct, Motivate and Organize teams',
                                      style: GoogleFonts.syne(
                                          color: Colors.purple, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.purple,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .90,
                            child: Text(
                              'Venue',
                              style: GoogleFonts.syne(
                                  color: Colors.purple, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .92,
                            height: height * .06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: !editVenue
                                        ? Text(
                                            venue,
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 16),
                                          )
                                        : TextFormField(
                                            initialValue: venue,
                                            textInputAction:
                                                TextInputAction.done,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              setState(() => {
                                                    editVenue = false,
                                                    venue = value
                                                  });
                                            })),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.purple,
                                  ),
                                  onPressed: () {
                                    setState(() => {
                                          editVenue = true,
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.purple,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .90,
                            child: Text(
                              'Price',
                              style: GoogleFonts.syne(
                                  color: Colors.purple, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * .92,
                            height: height * .06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: !editPrice
                                        ? Text(
                                            price,
                                            style: GoogleFonts.syne(
                                                color: Colors.purple,
                                                fontSize: 16),
                                          )
                                        : TextFormField(
                                            initialValue: venue,
                                            textInputAction:
                                                TextInputAction.done,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            onFieldSubmitted: (value) {
                                              setState(() => {
                                                    editPrice = false,
                                                    price = value
                                                  });
                                            })),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.purple,
                                  ),
                                  onPressed: () {
                                    setState(() => {
                                          editPrice = true,
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 1,
                            height: height * .10,
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Save This Gig',
                                  style: GoogleFonts.syne(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 1,
                            height: height * .10,
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Delete This Gig',
                                  style: GoogleFonts.syne(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
