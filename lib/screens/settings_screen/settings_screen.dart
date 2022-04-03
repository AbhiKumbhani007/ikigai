import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/user_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookingController bookingController = Get.find();
    UserController userController = Get.find();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Center(
          //     child: CircleAvatar(
          //       backgroundImage: NetworkImage(
          //           'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=211'),
          //       radius: 70,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Profile',
                style:
                    GoogleFonts.lato(fontSize: 26, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: const Icon(Icons.person),
              title: Text(userController.name.value,
                  style: GoogleFonts.roboto(fontSize: 16))),
          const SizedBox(
            height: 5,
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          ListTile(
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: const Icon(Icons.email),
              title: Text(userController.email.value,
                  style: GoogleFonts.roboto(fontSize: 16))),
          const SizedBox(
            height: 5,
          ),
          ListTile(
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: const Icon(Icons.phone),
              title: Text(userController.number.value,
                  style: GoogleFonts.roboto(fontSize: 16))),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            tileColor: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: const Icon(
              Icons.logout,
              size: 27,
            ),
            title: const Text('Logout', style: TextStyle(fontSize: 18)),
            onTap: () async{
              bookingController.listOfMyBooking.value = [];
              SharedPreferences _pref=await SharedPreferences.getInstance();
              _pref.setString('email', "");
              _pref.setString('password', "");
              // Get.delete<BookingController>();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/login", (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
