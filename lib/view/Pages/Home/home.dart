import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  // ignore: use_key_in_widget_constructors
  const HomeScreen(this.user);
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You are Logged in succesfully",
              style: TextStyle(color: Colors.lightBlue, fontSize: 32),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${user!.phoneNumber}",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
