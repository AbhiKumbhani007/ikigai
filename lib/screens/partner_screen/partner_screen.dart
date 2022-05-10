import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            image: AssetImage('assets/images/sarthhy.jpg'))
                        .image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Sarrthy ',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('Your neighbour hood delivery partner',
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
                  onTap: _launchInstaJobOfferURL,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                      image:
                          AssetImage('assets/images/partner_base_logo_1.jpg'),
                    ).image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('instajoboffer',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('Fastest way to get your dream job',
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
                  onTap: _launchYouthForSevarURL,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: const Image(
                      image:
                          AssetImage('assets/images/partner_base_logo_1.jpg'),
                    ).image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Youth for Seva',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('', // Add Description Here
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
                    backgroundImage: Image(
                      image: AssetImage(
                        'assets/images/gosave.jpg',
                      ),
                    ).image,
                    backgroundColor: Colors.deepPurple,
                  ),
                  title: Text('Go save',
                      style: GoogleFonts.prompt(
                          fontSize: 24, color: Colors.deepPurple)),
                  subtitle: Text('', // Add Description Here
                      style: GoogleFonts.prompt(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //       horizontal: MediaQuery.of(context).size.width * 0.02,
        //       vertical: MediaQuery.of(context).size.height * 0.01),
        //   child: SizedBox(
        //     height: 100,
        //     child: Card(
        //       color: Color.fromARGB(255, 255, 255, 255),
        //       shape: RoundedRectangleBorder(
        //         side: const BorderSide(color: Colors.white70, width: 1),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       elevation: 2,
        //       child: Center(
        //         child: ListTile(
        //           leading: CircleAvatar(
        //             radius: 30,
        //             backgroundImage: const Image(
        //               image:
        //                   AssetImage('assets/images/partner_base_logo_1.jpg'),
        //             ).image,
        //             backgroundColor: Colors.deepPurple,
        //           ),
        //           title: Text('C A Shekhar',
        //               style: GoogleFonts.prompt(
        //                   fontSize: 24, color: Colors.deepPurple)),
        //           subtitle: Text('Financial advisory services',
        //               style: GoogleFonts.prompt(
        //                   fontSize: 16, color: Colors.black)),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

_launchInstaJobOfferURL() async {
  const url = 'http://instajoboffer.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchYouthForSevarURL() async {
  const url = 'https://www.youthforseva.org/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
