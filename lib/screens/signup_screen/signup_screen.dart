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
  String _mailerror = "";
  String _passerror = "";
  String _fullName = "";
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
        Authentication.SignUp(email, password, fullName).then((value) {
          if (value != "SUCCESS") {
            // _a = false;
          }
        });
        setState(() {
          _a = true;
        });
        await Navigator.pushNamed(context, "/login");
        setState(() {
          _a = false;
        });
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
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Name", labelText: "Name"),
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
                  TextFormField(
                    onChanged: (val) {
                      _passerror = "";
                      password = val;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Cannot be empty";
                      }
                      if (_a == false) {
                        _a = true;
                        return "Enter Valid Password";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (val) {
                      _fullName = "";
                      fullName = val;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Name", labelText: "Full Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Full Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   child: Material(
                  //     color: Colors.deepPurple,
                  //     borderRadius: BorderRadius.circular(8),

                  //     //  color: Colors.transparent,
                  //     child: InkWell(
                  //       // splashColor: Colors.black,
                  //       // onTap: () => moveToHome(context),
                  //       onTap: () {
                  //         Authentication()
                  //             .SignIn(email, password)
                  //             .then((value) {
                  //           if (value == "SUCCESS") {
                  //            Navigator.pushNamed(context, "/home");
                  //           }
                  //           showError(value);
                  //         });
                  //       },
                  //       child: AnimatedContainer(
                  //         duration: Duration.zero,
                  //         alignment: Alignment.center,
                  //         // width: _a ? 50 : 150,
                  //         width: 150,
                  //         height: 50,
                  //         child: Text(
                  //           "LOGIN",
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    color: Colors.white,
                    child: Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),

                      //  color: Colors.transparent,
                      child: InkWell(
                        // splashColor: Colors.black,
                        // onTap: () => moveToHome(context),
                        onTap: () {
                          moveToLogin(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration.zero,
                          alignment: Alignment.center,
                          // width: _a ? 50 : 150,
                          width: 150,
                          height: 50,
                          child: Text("Sign Up",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
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
