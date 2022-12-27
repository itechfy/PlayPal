import 'package:flutter/material.dart';

class MyStudents extends StatefulWidget {
  const MyStudents({Key? key}) : super(key: key);

  @override
  State<MyStudents> createState() => _MyStudentsState();
}

class _MyStudentsState extends State<MyStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: Container(

        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Text('My Students')
          ],
        ),
      )),
    );
  }
}
