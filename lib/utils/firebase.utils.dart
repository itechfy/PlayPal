import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playpal/view/Pages/Auth/OTP.dart';
import 'package:playpal/view/Pages/Navbar/coachNavbar.dart';
import 'package:playpal/view/Pages/Navbar/playerNavbar.dart';
import 'package:provider/provider.dart';

import '../view_model/user_provider.dart';

Future registerUser(String? role, String? displayName, String mobile,
    BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {
        auth.signInWithCredential(authCredential).then((UserCredential result) {
          User? person = result.user;
          person!.reload();
          Provider.of<UserProvider>(context, listen: false).setRole(role);
          if (role == "player") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PlayerNavbar()));
          } else if (role == "coaches") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CoachNavbar()));
          }
        }).catchError((e) {
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        // print(forceResendingToken);
        // print("code sent");
        Provider.of<UserProvider>(context, listen: false).setRole(role);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OTP(
                      displayName: displayName,
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
