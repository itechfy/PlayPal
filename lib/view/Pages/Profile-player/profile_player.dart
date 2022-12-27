import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/view/Pages/Favourites/myfavouritegrounds.dart';
import 'package:playpal/view/Pages/My-Bookings/mybookings.dart';
import 'package:playpal/view/Pages/Payments/payments.dart';
import 'package:provider/provider.dart';
import '../../../view_model/user_provider.dart';
import '../ContinueAs/continueas.dart';

class ProfilePlayer extends StatefulWidget {
  const ProfilePlayer({super.key});

  @override
  State<ProfilePlayer> createState() => _ProfilePlayerState();
}

class _ProfilePlayerState extends State<ProfilePlayer> {
  String title = "Moin Kazmi";
  bool isEditable = false;
  String phoneNumber = "+923049498877";
  bool isNumber = false;
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    var width=size.width;
    var height=size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(

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

                height: 90,
              ),
              Center(child: CircleAvatar(

                child: Icon(FontAwesomeIcons.user,color: Colors.black,size: 50,),
                radius: 70,
                backgroundColor: Colors.white,
              )),

              SizedBox(

                height: 25,
              ),
              
              Text('Moin Kazmi',style: GoogleFonts.syne(color: Colors.white,fontSize: 16),),
              SizedBox(

                height: 40,
              ),


              GestureDetector(

                onTap: ()
                {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyBookings()),
                  );

                },
                child: Container(
                  width: width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.book,
                            size: 22,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Text(
                              'My Bookings',
                              style: GoogleFonts.syne(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(

                height: 25,
              ),

              GestureDetector(

                onTap: ()
                {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Payments()),
                  );

                },
                child: Container(
                  width: width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBillTransfer,
                            size: 22,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Text(
                              'My Billings',
                              style: GoogleFonts.syne(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(

                height: 25,
              ),

              GestureDetector(
                onTap: ()
                {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyFavouriteGrounds()),
                  );

                },

                child: Container(
                  width: width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.heart,
                            size: 22,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Text(
                              'My Favourite Grounds',
                              style: GoogleFonts.syne(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),

              Spacer(),
              Align(


                alignment: Alignment.bottomCenter,

                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(

                   onTap: () {
                Provider.of<UserProvider>(context, listen: false)
                    .SignOut()
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => ContinueAs()),
                        (route) => false));
              },
                    child: Container(

                      width: width*.85,
                      height: height*.07,

                      decoration: BoxDecoration(


                        color: Color.fromARGB(255, 183, 14, 183),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGNOUT',
                            style: GoogleFonts.syne(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
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
    );
  }
}
