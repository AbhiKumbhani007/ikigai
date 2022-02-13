import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/screens/components/drawer.dart';
import 'package:ikigai/screens/components/eventnews_component.dart';

import '../Events/add_event_form.dart';
import '../Events/request_event_form.dart';
import '../components/gridbooking.dart';
import 'components/feature_component.dart';

import 'package:whatsapp_unilink/whatsapp_unilink.dart';
// For Flutter applications, you'll most likely want to use
// the url_launcher package.
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Bookings',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
            overlayColor: Colors.deepPurple,
            overlayOpacity: .4,
            spaceBetweenChildren: 12,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                child: Icon(Icons.mail),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    // text: "Hey! I'm inquiring about the apartment listing",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
              SpeedDialChild(child: Icon(Icons.chat))
            ]),
        backgroundColor: const Color.fromRGBO(246, 249, 254, 1),
        endDrawer: MyDrawer(),
        appBar: AppBar(
          // centerTitle: true,
          // elevation: 0,
          // backgroundColor: Colors.white,
          title: const Text(
            "Ikigai",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 48,
                      backgroundImage: NetworkImage(
                          "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=194"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Location: ",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Surat",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeatureComponent(
                      icon: Icons.work,
                      text: "Co-Working",
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => GridBooking()));
                      },
                    ),
                    FeatureComponent(
                      icon: Icons.book,
                      text: "Co-Learning",
                    ),
                    FeatureComponent(
                      icon: Icons.event,
                      text: "Organize Events",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => EventFormScreen()));
                      },
                    ),
                    FeatureComponent(
                      icon: Icons.work,
                      text: "Request Event",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => requestEventScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "upcoming events",
                  style: GoogleFonts.montserrat(
                      color: Color.fromRGBO(5, 1, 82, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Flexible(
                  child: ListView(
                children: [
                  EventNewsTile(),
                  EventNewsTile(),
                  EventNewsTile(),
                ],
              ))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 28,
                // onPressed: () {},
              ),
              label: 'Home',
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                color: Colors.white,
              ),
              label: 'Bookings',
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: 'Profile',
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              label: 'Settings',
              // backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 28),
          onTap: _onItemTapped,
        ));
  }
}
