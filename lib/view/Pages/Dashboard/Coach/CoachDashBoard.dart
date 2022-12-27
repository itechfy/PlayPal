import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/services/coach.services.dart';
import 'package:playpal/view/Pages/Coach-verification/coachverification.dart';
import 'package:playpal/view/Pages/Create-gig/creategig.dart';
import 'package:playpal/view/Pages/My-Gig/mygig.dart';
import 'package:playpal/view/Pages/My-students/mystudents.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/user_provider.dart';
import '../../ContinueAs/continueas.dart';

class CoachDashboard extends StatefulWidget {
  const CoachDashboard({Key? key}) : super(key: key);

  @override
  State<CoachDashboard> createState() => _CoachDashboardState();
}

class _CoachDashboardState extends State<CoachDashboard> {
  String coachStatus = '';

  @override
  void initState() {
    CoachService.isCoachVerified(
            Provider.of<UserProvider>(context, listen: false).user?.uid)
        .then((value) => {
              setState(() => {this.coachStatus = value.data.toString()})
            });

    print(this.coachStatus);

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List icons = [
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      Icon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
    ];

    List names = [
      'Ahmed',
      'Hamza',
      'Tipu ',
      'Sikandar',
      'Basharat',
      'Mohsin',
      'Usman',
    ];

    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 80, 6, 95),
                    Color.fromARGB(255, 39, 2, 63),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Container(
                width: width * .10,
                height: height * .05,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/chotalogo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyStudents()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.sports_soccer_outlined,
                  color: Colors.purple,
                ),
                title: Text(
                  'My Students',
                  style: GoogleFonts.syne(color: Colors.purple, fontSize: 15),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyGig()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.group_add_outlined,
                  color: Colors.purple,
                ),
                title: Text('My Gig',
                    style:
                        GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.purple,
              ),
              title: Text('Settings',
                  style: GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
            ),
            Divider(
              color: Colors.purple,
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<UserProvider>(context, listen: false)
                    .SignOut()
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => ContinueAs()),
                        (route) => false));
              },
              child: ListTile(
                leading: Icon(
                  Icons.door_back_door_outlined,
                  color: Colors.purple,
                ),
                title: Text('Sign out',
                    style:
                        GoogleFonts.syne(color: Colors.purple, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: new Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${Provider.of<UserProvider>(context, listen: false).user!.displayName ?? ''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * .12,
                        height: height * .05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Color.fromARGB(255, 58, 6, 88),
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
                          FontAwesomeIcons.user,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * .90,
                  height: height * .18,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * .35,
                        height: height * .04,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(129, 139, 28, 96),

                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ), //BorderRadius.all
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontWeight: FontWeight.w500,
                                fontSize: 64,
                              ),
                            ),
                            Text(
                              'Students',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      // Add coach login here
                      this.coachStatus == "not-a-coach"
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CoachVerification()),
                                );
                              },
                              child: Container(
                                width: width * .50,
                                height: height * .06,
                                decoration: BoxDecoration(
                                  color: Color(0xff570a57),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xffA91079),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ), //BorderRadius.all
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                          "assets/images/rounded-arrow-right.png"),
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Verify Account',
                                      style: GoogleFonts.syne(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'to become a coach',
                                      style: GoogleFonts.syne(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ), // pending verification
                            )
                          : coachStatus == 'false'
                              ? Container(
                                  width: width * .50,
                                  height: height * .06,
                                  decoration: BoxDecoration(
                                    color: Color(0xff570a57),
                                    border: Border.all(
                                      width: 1.0,
                                      color: Color(0xffA91079),
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ), //BorderRadius.all
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/images/process.png"),
                                        color: Color(0xffFF5BE1),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Account Verification',
                                        style: GoogleFonts.syne(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'is in process',
                                        style: GoogleFonts.syne(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Takes upto 2 days',
                                        style: GoogleFonts.syne(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ), // Teach now
                                )
                              : coachStatus == 'true'
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateGig()),
                                        );
                                      },
                                      child: Container(
                                        width: width * .50,
                                        height: height * .06,
                                        decoration: BoxDecoration(
                                          color: Color(0xff570a57),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Color(0xffA91079),
                                            style: BorderStyle.solid,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/plus.png"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Teach now',
                                              style: GoogleFonts.syne(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: width * .50,
                                      height: height * .06,
                                      decoration: BoxDecoration(
                                        color: Color(0xff570a57),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ), //BorderRadius.all
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Loading...",
                                          style: TextStyle(
                                              color: Color(0xffFF5BE1)),
                                        ),
                                      ),
                                    ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: width * .90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Students',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'See All >',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: width * .85,
                  height: height * .14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Container(
                            width: width * .15,
                            height: height * .07,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 23, 101),
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.all(10),
                            child: icons[index],
                          ),
                          Text(
                            names[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: width * .90,
                  child: Text(
                    'You can try',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Syne',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * .90,
                  height: height * .20,
                  child: Image.asset("assets/images/pic.png", fit: BoxFit.fill),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
