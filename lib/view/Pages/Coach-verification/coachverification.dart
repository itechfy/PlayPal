import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playpal/services/coach.services.dart';
import 'package:playpal/view/Pages/Navbar/coachNavbar.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:playpal/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class CoachVerification extends StatefulWidget {
  CoachVerification({super.key});

  @override
  State<CoachVerification> createState() => _CoachVerificationState();
}

class _CoachVerificationState extends State<CoachVerification> {
  String? pickedDate = '';

  File fileCV = File('');
  File fileCertificate = File('');
  String fileNameCV = '';
  String fileNameCertificate = '';

  _CoachVerificationState() {
    fileNameCV = fileCV.path.split(Platform.pathSeparator).last;
    fileNameCertificate =
        fileCertificate.path.split(Platform.pathSeparator).last;
  }

  final ExperienceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    ExperienceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CoachNavbar()),
                  );
                },
                child: Container(
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
                      Text('Verification',
                          style: GoogleFonts.syne(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
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
                height: height * .09,
                child: Text(
                  'Please Provide the Following Documents.',
                  style: GoogleFonts.syne(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: width * .85,
                      height: height * .20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: Container(
                              width: width * .40,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(129, 139, 28, 96),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 179, 11, 95)
                                //         .withOpacity(0.5),
                                //     spreadRadius: 2,
                                //     blurRadius: 7,
                                //     offset: Offset(0, 3), // changes position of shadow
                                //   ),
                                // ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ), //BorderRadius.all
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * .15,
                                    height: height * .04,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      FontAwesomeIcons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Add CV',
                                      style: GoogleFonts.syne(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(
                                    this.fileNameCV,
                                    style:
                                        TextStyle(color: Colors.grey.shade300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickFileCertificate();
                            },
                            child: Container(
                              width: width * .40,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(129, 139, 28, 96),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 179, 11, 95)
                                //         .withOpacity(0.5),
                                //     spreadRadius: 2,
                                //     blurRadius: 7,
                                //     offset: Offset(0, 3), // changes position of shadow
                                //   ),
                                // ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ), //BorderRadius.all
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * .15,
                                    height: height * .04,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      FontAwesomeIcons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('Add 1 Certificate',
                                      style: GoogleFonts.syne(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(fileNameCertificate),
                                ],
                              ),
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
                      child: Row(
                        children: [
                          Text('Choose your date of birth',
                              style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: width * .85,
                      height: height * .10,
                      child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.calendar,
                                size: 18,
                                color: Colors.pink,
                              ),
                              filled: true,
                              suffixIcon: Icon(
                                Icons.arrow_right_alt,
                                color: Colors.white,
                              ),
                              fillColor: Color.fromARGB(255, 179, 11, 95)
                                  .withOpacity(0.5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              hintStyle: TextStyle(color: Colors.white),
                              hintText:
                                  "${this.pickedDate == '' ? 'Date of Birth' : this.pickedDate}",
                              labelStyle: TextStyle(fontSize: 12)),
                          onTap: () async {
                            DateTime? d = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    1800), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            setState(() {
                              String t = d.toString();
                              this.pickedDate = t.split(' ')[0];
                            });
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width * .85,
                      height: height * .10,
                      child: TextField(
                        style: GoogleFonts.syne(color: Colors.white),
                        controller: ExperienceController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.hashtag,
                              size: 18,
                              color: Colors.pink,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 179, 11, 95)
                                .withOpacity(0.5),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "No of Experience",
                            labelStyle: TextStyle(fontSize: 12)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (fileNameCV != '' &&
                            fileNameCertificate != '' &&
                            this.pickedDate != '' &&
                            this.ExperienceController.text.trim() != '') {
                          var formData = FormData.fromMap({
                            'files[]': [
                              await MultipartFile.fromFile(fileCV.path,
                                  filename: fileNameCV),
                              await MultipartFile.fromFile(fileCertificate.path,
                                  filename: fileNameCertificate),
                            ],
                            'userID': Provider.of<UserProvider>(context,
                                    listen: false)
                                .user
                                ?.uid,
                            'DOB': this.pickedDate,
                            'experience': this
                                    .ExperienceController
                                    .text
                                    .trim()
                                    .toString() +
                                ' years',
                          });

                          await CoachService.sendDataForVerification(formData)
                              .then((value) => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CoachNavbar()),
                                    )
                                  });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Fields should not be empty")));
                        }
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
                              Text('Continue',
                                  style: GoogleFonts.syne(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.longArrowAltRight,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      setState(() {
        fileCV = File(result.files.single.path ?? "");
        fileNameCV = fileCV.path.split(Platform.pathSeparator).last;
      });
    }
  }

  void pickFileCertificate() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      setState(() {
        fileCertificate = File(result.files.single.path ?? "");
        this.fileNameCertificate =
            fileCertificate.path.split(Platform.pathSeparator).last;
      });
    }
  }
}
