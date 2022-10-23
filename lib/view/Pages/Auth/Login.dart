import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playpal/models/validators/passwordValidator.dart';
import 'package:playpal/models/validators/phoneNumValidator.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isObscure = true;
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

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
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Sign in',
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
                      'Sign in your account and start enjoying the experience of sports world',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController1,
                                autofocus: true,
                                obscureText: false,
                                validator: (value) {
                                  return isMobileNumberValid(value);
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.0),
                                  hintText: 'Phone number',
                                  hintStyle: TextStyle(
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
                                    Icons.phone_outlined,
                                    color: Color(0xFFF806CC),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 90, 90),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                keyboardType: TextInputType.phone,
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
                                obscureText: _isObscure,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  String pwd = isPasswordValid(value);
                                  pwd != ''
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            duration: new Duration(seconds: 3),
                                            content: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // add your preferred icon here
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Icon(
                                                    Icons.info_outline,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                // add your preferred text content here
                                                Flexible(
                                                  child: Text(
                                                    pwd,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.white,
                                          ),
                                        )
                                      : '';
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
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
                                    Icons.lock_outlined,
                                    color: Color(0xFFF806CC),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFFF806CC),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  errorStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 90, 90),
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Syne',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => {},
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                      "Forget password?",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
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
                            width: double.infinity,
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
                            margin:
                                const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 4.0),
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    // button
                    SizedBox(
                      height: 86,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
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
                                    "Create Account",
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
