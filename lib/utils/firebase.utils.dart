import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/Auth/OTP.dart';
import 'package:playpal/view/Pages/Home/home.dart';

Future registerUser(String mobile, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {
        auth
            .signInWithCredential(authCredential)
            .then((UserCredential result) {
          User? person = result.user;
          Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen(person)));
        }).catchError((e) {
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        print(forceResendingToken);
        print("code sent");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OTP(
                      verificationId: verificationId,
                      phoneNumber: mobile,
                    )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        print(verificationId);
        print("Timeout");
      });
}
