import 'dart:ffi';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ikigai/constants/routes.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:ikigai/controllers/user_controller.dart';
import 'package:ikigai/screens/Events/event_detail_screen.dart';
import 'package:ikigai/screens/Home%20Screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ikigai/screens/components/gridbooking.dart';
import 'package:ikigai/screens/login_screen/login_sceen.dart';
import 'package:ikigai/screens/signup_screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/matrix_controller.dart';
// void main() {
//   runApp(const MyApp());
// }


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MatrixController matrixController = Get.put(MatrixController());
  UserController userController = Get.put(UserController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // onGenerateRoute: generateRoute,
      navigatorKey: navigatorKey,
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: LoginPage(),
      initialRoute: "/login",
      routes: {
        // MyRoutes.homeRoute: (context) => LoginPage(),
        // "/home": (context) => HomeScreen()
        "/": (context) => LoginPage(),
        "/home": (context) => HomeScreen(),
        "/grid_booking": (context) => GridBooking(),
        "/signup": (context) => SignupPage(),
        "/login": (context) => LoginPage(),
        "/event_details": (context) => EventDetailsScreen(),
      },
    );
  }
}

Future<bool> getEmail()async{
  SharedPreferences sf = await SharedPreferences.getInstance();
  String email = sf.getString('email').toString();
  if(email == null || email == ""){
    return false;
  }
  return true;
}