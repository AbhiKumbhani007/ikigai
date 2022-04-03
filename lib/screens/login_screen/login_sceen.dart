// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/booking_controller.dart';
// import 'package:ikigai/constants/routes.dart';
import 'package:ikigai/screens/Home%20Screen/home_screen.dart';
import 'package:ikigai/services/payment_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_services.dart';
import '../components/input_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mobileNo = "";
  var email = "";
  var password = "";
  var fullName = "";
  String _mailerror = "";
  String _passerror = "";
  String _fullName = "";
  String _mobileerror = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userbox = GetStorage("User");

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    print(" ${GetStorage().read("isLoggedin")}");

    super.initState();
  }

  void showError(value) {
    setState(() {
      if (value == "WRONG_PASS") {
        _passerror = "wrong password";
        _mailerror = "";
      } else if (value == "USER_NOT_FOUND") {
        _mailerror = "email not found";
        _passerror = "";
      }
    });
  }

  final _formkey = GlobalKey<FormState>();
  bool _a = false;

  moveToHome(BuildContext context) async {
    {
      if (_formkey.currentState!.validate()) {
        setState(() {
          // _a = true;
          Authentication()
              .SignIn(emailController.text, passwordController.text)
              .then((value) {
            if (value == "SUCCESS") {
              userController.updateUserId();
              Navigator.pushNamed(context, "/home");
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Column(children: [
                Image.asset(
                  'assets/images/login_img.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text('Sign In',
                      style: GoogleFonts.prompt(
                          fontSize: 32, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 12,
                ),
                InputTextField(
                  hintText: 'Email',
                  fieldName: 'Email',
                  size: size,
                  fieldController: emailController,
                ),
                const SizedBox(
                  height: 12,
                ),
                InputTextField(
                  size: size,
                  hintText: 'Password',
                  fieldName: 'Password',
                  fieldController: passwordController,
                ),
                const SizedBox(
                  height: 45,
                ),
                // Image.asset("assets/images/login_img.png"),
                // SizedBox(
                //   height: 20,
                // ),
                // Text(
                //   "Welcome To Our App",
                //   style: GoogleFonts.lato(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 24,
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Column(
                //     children: [
                //       TextFormField(
                //         decoration: InputDecoration(
                //             hintText: "Enter Email", labelText: "E-mail"),
                //         onChanged: (val) {
                //           _mailerror = "";
                //           email = val;
                //         },
                //         validator: (value) {
                //           if (value!.isEmpty) {
                //             return "Username Cannot be empty";
                //           }
                //           return null;
                //         },
                //       ),
                //       TextFormField(
                //         onChanged: (val) {
                //           _passerror = "";
                //           password = val;
                //         },
                //         obscureText: true,
                //         decoration: InputDecoration(
                //             hintText: "Enter Password", labelText: "Password"),
                //         validator: (value) {
                //           if (value!.isEmpty) {
                //             return "Password Cannot be empty";
                //           }
                //           return null;
                //         },
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         color: Colors.white,
                //         child: Material(
                //           color: Colors.deepPurple,
                //           borderRadius: BorderRadius.circular(8),
                //           child: InkWell(
                //             onTap: () {
                //               moveToHome(context);
                //             },
                //             child: AnimatedContainer(
                //               duration: Duration.zero,
                //               alignment: Alignment.center,
                //               // width: _a ? 50 : 150,
                //               width: 150,
                //               height: 50,
                //               child: Text(
                //                 "LOGIN",
                //                 style: GoogleFonts.lato(
                //                   color: Colors.white,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         child: RichText(
                //           text: TextSpan(
                //               text: "Sign Up",
                //               style: GoogleFonts.lato(
                //                 color: Colors.deepPurple,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 14,
                //               ),
                //               recognizer: new TapGestureRecognizer()
                //                 ..onTap = () {
                //                   Navigator.pushNamed(context, "/signup");
                //                 }),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ]),
              ElevatedButton(
                onPressed: () {
                  moveToHome(context);
                },
                child: Text('Sign In',
                    style: GoogleFonts.prompt(
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromRGBO(167, 171, 240, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    fixedSize: const Size(350, 60),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.prompt(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: const Color.fromRGBO(183, 183, 198, 1)),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white.withOpacity(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.prompt(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
