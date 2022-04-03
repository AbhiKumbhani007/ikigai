import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/main.dart';
import 'package:ikigai/screens/Home%20Screen/home_screen.dart';
import 'package:ikigai/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_services.dart';

class UserController extends GetxController {
  UserServices userServices = UserServices();
  var uid = "".obs;
  var name = "".obs;
  var email = "".obs;
  var number = "".obs;
  @override
  Future<void> onInit() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    String email = _prefs.getString('email').toString();
    String pass = _prefs.getString('password').toString();
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        uid.value = "";
      } else {
        print('User is signed in!');
        uid.value = user.uid;
      }
    });
    if (email != null && email != "") {
      Authentication().SignIn(email, pass).then((value) {
        if (value == "SUCCESS") {
          userController.updateUserId();
          // Navigator.push(HomeScreen());
          //Get.to("/home");
          navigatorKey.currentState?.pushNamed("/home");
        }
      });
    }
    // updateUserDetails();
    super.onInit();
  }

  void updateUserId() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        uid.value = "";
      } else {
        print('User is signed in!');
        uid.value = user.uid;
      }
    });
    updateUserDetails();
  }

  void updateUserDetails() {
    userServices.fetchUserDetails(uid.value);
  }
}
