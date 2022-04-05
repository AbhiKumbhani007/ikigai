import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerScreen extends StatefulWidget {
  const PartnerScreen({Key? key}) : super(key: key);

  @override
  _PartnerScreenState createState() => _PartnerScreenState();
}

class _PartnerScreenState extends State<PartnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Container(
            height: 100,
            // width: 350,
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              // elevation: 2,
              child: Center(
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                            image: AssetImage('assets/images/google_logo.png'))
                        .image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Google',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('Google LLC',
                      style: GoogleFonts.prompt(fontSize: 16)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: SizedBox(
            height: 100,
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                      image: AssetImage('assets/images/insta_logo.png'),
                    ).image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Instagram',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('Instagram LLC',
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: SizedBox(
            height: 100,
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                      image: AssetImage('assets/images/demo_logo.png'),
                    ).image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Brijesh Patadiya',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('Flutter Devloper',
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
