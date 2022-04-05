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
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.01),
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
                  obsecure: true,
                  hintText: 'Password',
                  fieldName: 'Password',
                  fieldController: passwordController,
                ),
                const SizedBox(
                  height: 45,
                ),
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
