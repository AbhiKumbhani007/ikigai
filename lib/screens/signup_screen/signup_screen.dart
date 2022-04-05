// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ikigai/constants/routes.dart';
import 'package:ikigai/screens/Home%20Screen/home_screen.dart';

import '../../services/auth_services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var email = "";
  var password = "";
  var fullName = "";
  var mobileNo = "";
  String _mailerror = "";
  String _passerror = "";
  String _fullName = "";
  String _mobileerror = "";
  final userbox = GetStorage("User");

  @override
  void initState() {
    print(" ${GetStorage().read("isLoggedin")}");
    super.initState();
  }

  // void showError(value) {
  //   setState(() {
  //     if (value == "WRONG_PASS") {
  //       _passerror = "wrong password";
  //       _mailerror = "";
  //     } else if (value == "USER_NOT_FOUND") {
  //       _mailerror = "email not found";
  //       _passerror = "";
  //     }
  //   });
  // }

  final _formkey = GlobalKey<FormState>();
  bool _a = false;
  @override
  moveToLogin(BuildContext context) async {
    {
      if (_formkey.currentState!.validate()) {
        Authentication.SignUp(email, password, fullName, mobileNo)
            .then((value) {
          Navigator.pushNamed(context, "/login");
        });
        // setState(() {
        //   _a = true;
        // });

        // setState(() {
        //   _a = false;
        // });
      }
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child:
          // ignore: prefer_const_constructors
          SingleChildScrollView(
        // padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(children: [
            Image.asset("assets/images/login_img.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome To Our App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text("Name",
                        style: GoogleFonts.prompt(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      _fullName = "";
                      fullName = val;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      hintStyle: GoogleFonts.prompt(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 109, 109, 109)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(183, 183, 198, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(125, 183, 183, 198)),
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Full Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text("E-mail",
                        style: GoogleFonts.prompt(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      hintStyle: GoogleFonts.prompt(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 109, 109, 109)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(183, 183, 198, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(125, 183, 183, 198)),
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    onChanged: (val) {
                      _mailerror = "";
                      email = val;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username Cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text("Password",
                        style: GoogleFonts.prompt(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      _passerror = "";
                      password = val;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      hintStyle: GoogleFonts.prompt(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 109, 109, 109)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(183, 183, 198, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(125, 183, 183, 198)),
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text("Mobile No.",
                        style: GoogleFonts.prompt(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mobile No.",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.width * 0.05),
                      hintStyle: GoogleFonts.prompt(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 109, 109, 109)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(183, 183, 198, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(80)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(125, 183, 183, 198)),
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    onChanged: (val) {
                      _mobileerror = "";
                      mobileNo = val;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mobile No. Cannot be empty";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      moveToLogin(context);
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
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
