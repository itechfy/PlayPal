import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playpal/models/User/user.model.dart';
import 'package:playpal/utils/firebase.utils.dart';
import 'package:playpal/view/Pages/Auth/Login.dart';
import 'package:playpal/view_model/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/validators/phoneNumValidator.dart';

class SignUpWidget extends StatefulWidget {
  String? role;
  SignUpWidget({Key? key, this.role}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  bool isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

// To register user with phone number
  // Future registerUser(String mobile, BuildContext context) async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   _auth.verifyPhoneNumber(
  //       phoneNumber: textController2!.text,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential authCredential) async {
  //         print("verification completed ${authCredential.smsCode}");
  //         User? user = FirebaseAuth.instance.currentUser;
  //         setState(() {
  //           // OTP controller's text
  //           //  this.otpCode.text = authCredential.smsCode!;
  //         });
  //         if (authCredential.smsCode != null) {
  //           try {
  //             UserCredential credential =
  //                 await user!.linkWithCredential(authCredential);
  //           } on FirebaseAuthException catch (e) {
  //             if (e.code == 'provider-already-linked') {
  //               await _auth.signInWithCredential(authCredential);
  //             }
  //           }
  //           setState(() {
  //             // isLoading = false;
  //           });
  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => HomeScreen(
  //                         user: user,
  //                       )));
  //         }
  //       },
  //       verificationFailed: (FirebaseAuthException authException) {
  //         print(authException.message);
  //       },
  //       codeSent: (String verificationId, int? forceResendingToken) {
  //         print(forceResendingToken);
  //         print("code sent");
  //         Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => OTP(
  //                       verificationId: verificationId,
  //                       phoneNumber: textController2!.text,
  //                     )));
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         verificationId = verificationId;
  //         print(verificationId);
  //         print("Timout");
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF2E0249),
            Color(0xFF570A57),
          ],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/imgs/back-btn.svg"),
                        ),
                        const Text(
                          '1/2',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Syne",
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Create your account and start enjoying the experience of sports world',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF570A57),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA91079),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Color(0xFF570A57),
                              prefixIcon: Icon(
                                Icons.edit_outlined,
                                color: Color(0xFFF806CC),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            validator: (value) {
                              return isMobileNumberValid(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone number',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF570A57),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFA91079),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF570A57),
                              prefixIcon: const Icon(
                                Icons.call_outlined,
                                color: Color(0xFFF806CC),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Syne',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // button
                    // button
                    DecoratedBox(
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
                        child: TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: () {
                            //role, displayName, phoneNumber

                            setState(() {
                              isLoading = true;
                            });
                            registerUser(
                                widget.role,
                                textController1!.text.trim(),
                                textController2!.text.trim(),
                                context);
                            // Navigator.pushNamed(context, '/otp');
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: isLoading
                              ? Center(
                                  child: SizedBox(
                                    height: 100,
                                    child: SpinKitRing(
                                      color: Color(0xffA91079),
                                      lineWidth: 5.0,
                                      size: 30,
                                      duration: Duration(
                                        milliseconds: 4000,
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(
                                  "Continue",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          onPressed: () {
                            //context.read<UserProvider>().setRole(widget.role);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWidget(
                                        role: widget.role,
                                      )),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xffFF5BE1),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
