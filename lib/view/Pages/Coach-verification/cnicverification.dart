import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CNIC extends StatefulWidget {
  @override
  State<CNIC> createState() => _CNICState();
}

class _CNICState extends State<CNIC> {
  File? _image;

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource.camera, maxHeight: 300, maxWidth: 600);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              height: 30,
            ),
            Container(
              width: width * .85,
              height: height * .09,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
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
                  SizedBox(
                    width: 15,
                  ),
                  Text('NIC Verification',
                      style: GoogleFonts.syne(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: width * .85,
              height: height * .09,
              child: Text(
                'National Identity Card Verification',
                style: GoogleFonts.syne(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * .85,
              height: height * .06,
              child: Text(
                'Fix front side of the National Identity Card on this camera.',
                style: GoogleFonts.syne(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: _image == null
                  ? Text(
                      'No CNIC Image Found',
                      style:
                          GoogleFonts.syne(color: Colors.white, fontSize: 14),
                    )
                  : Image.file(_image!),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
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
                        'Capture',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
            ),
          ],
        ),
      )),
    );
  }
}
