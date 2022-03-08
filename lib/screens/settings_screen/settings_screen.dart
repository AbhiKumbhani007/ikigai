import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=211'),
                radius: 70,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Abhishek Kumbhani',
                style: GoogleFonts.lato(fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: const Icon(Icons.email),
              title: Text('abhi1234kumbhani@gmail.com',
                  style: GoogleFonts.roboto(fontSize: 16))),
          const SizedBox(
            height: 5,
          ),
          ListTile(
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              leading: const Icon(Icons.phone),
              title:
                  Text('9624299959', style: GoogleFonts.roboto(fontSize: 16))),
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
            onTap: () {
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
