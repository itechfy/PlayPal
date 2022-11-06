import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({Key? key}) : super(key: key);

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
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Device\nLocation\nAccess',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Syne',
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'PlayPal needs to know your location to look nearby grounds for you.',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 60,
                    ),

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
                          onPressed: () {},
                          child: const Text(
                            "Allow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 86,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                        ),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Deny",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
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
