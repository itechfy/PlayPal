import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {

    var size= MediaQuery.of(context).size;
    var width=size.width;
    var height=size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            color: Colors.white,
            child: Column(

              children: [

                SizedBox(
                  height: 15,
                ),

                GestureDetector(

                  onTap: (){

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
                          'My Payments',
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: Color.fromARGB(255, 100, 19, 114),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

               Expanded(
                 child: Container(

                   height: MediaQuery.of(context).size.height,

                   child: ListView.builder(
                       itemCount: 6,

                       itemBuilder: (context,index){


                         return  Padding(
                           padding: const EdgeInsets.only(bottom: 25),
                           child: TicketWidget(
                             width: 350,
                             height: 600,
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
                                     'assets/images/launchLogo.png',
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
                                         'Ayub Park Cricket Ground',
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
                                         'From oct 21-23',
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
                                         'Price',
                                         style: GoogleFonts.syne(
                                             color: Colors.white38, fontSize: 12),
                                       ),
                                       Text(
                                         'RS/-15000',
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
                                         'RS/-15000',
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
                                         'Moin Kazmi',
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
                                         'Paid Through',
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
                                         'JazzCash',
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
                                     'assets/images/barcode.png',
                                     fit: BoxFit.cover,
                                   ),
                                 ),


                               ],
                             ),
                           ),
                         );

                       }




                   ),

                 ),
               ),


                SizedBox(

                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
