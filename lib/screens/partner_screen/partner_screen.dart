import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(2.5),
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
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                            image: AssetImage('assets/images/google_logo.png'))
                        .image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Google',
                      style: GoogleFonts.lato(
                          fontSize: 26, color: Colors.deepPurple)),
                  subtitle:
                      Text('Google LLC', style: GoogleFonts.lato(fontSize: 16)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.5),
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
                      style: GoogleFonts.lato(
                          fontSize: 26, color: Colors.deepPurple)),
                  subtitle: Text('Instagram LLC',
                      style:
                          GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.5),
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
                      style: GoogleFonts.lato(
                          fontSize: 26, color: Colors.deepPurple)),
                  subtitle: Text('Flutter Devloper',
                      style:
                          GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
    // Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10.0),
    //     side: const BorderSide(color: Colors.black, width: 1),
    //   ),
    //   child: SizedBox(
    //     height: MediaQuery.of(context).size.height * 0.15,
    //     child: ListTile(
    //       leading: CircleAvatar(
    //         radius: 50,
    //         backgroundImage:
    //             const Image(image: AssetImage('assets/images/login_img.png'))
    //                 .image,
    //         backgroundColor: Colors.black,
    //       ),
    //       title: Text('Partner', style: GoogleFonts.lato(fontSize: 26)),
    //     ),
    //   ),
    // );
  }
}
