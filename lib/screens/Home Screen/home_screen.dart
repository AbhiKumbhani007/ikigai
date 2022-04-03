// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/screens/components/eventnews_component.dart';
import '../../controllers/booking_controller.dart';
import '../Events/add_event_form.dart';
import '../Events/all_eventslist_screen.dart';
import '../Events/request_event_form.dart';
import '../components/gridbooking.dart';
import '../my_bookings/my_bookings_screen.dart';
import '../partner_screen/partner_screen.dart';
import '../settings_screen/settings_screen.dart';
import 'components/feature_component.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
// For Flutter applications, you'll most likely want to use
// the url_launcher package.
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    MyBooking(),
    AllEvents(),
    PartnerScreen(),
    SettingsScreen(),

    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  BookingController bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
            overlayColor: Colors.deepPurple,
            // icon: Icons.assistant,
            overlayOpacity: .4,
            spaceBetweenChildren: 12,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                label: "Others",
                child: Icon(Icons.verified_user_outlined),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    text: "Micellinious",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
              SpeedDialChild(
                label: "Water Bottle",
                child: CircleAvatar(
                    radius: 15,
                    child: Image.asset('assets/images/water_bottle.jpeg')),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    text: "1 Water Bottle on Seat:  ",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
              SpeedDialChild(
                label: "NewsPaper",
                child: CircleAvatar(
                    radius: 15,
                    child: Image.asset('assets/images/news_paper.jpeg')),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    text: "Today's News Paper On  Seat:",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
              SpeedDialChild(
                label: "Coffee",
                child: Icon(Icons.coffee),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    text: "1 Coffee On  Seat:  ",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
              SpeedDialChild(
                label: "Tea",
                child: CircleAvatar(
                    radius: 15, child: Image.asset('assets/images/chai.png')),
                onTap: () async {
                  final link = WhatsAppUnilink(
                    phoneNumber: '+91-9974884446',
                    text: "1 Tea On  Seat:  ",
                  );
                  // Convert the WhatsAppUnilink instance to a string.
                  // Use either Dart's string interpolation or the toString() method.
                  // The "launch" method is part of "url_launcher".
                  await launch('$link');
                },
              ),
            ]),
        backgroundColor: const Color.fromRGBO(246, 249, 254, 1),
        // endDrawer: MyDrawer(),
        appBar: AppBar(
          // centerTitle: true,
          // elevation: 0,
          // backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            "Ikigai",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
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
              backgroundColor: Colors.deepPurple,
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
                color: Colors.white,
              ),
              label: 'All Events',
              backgroundColor: Colors.deepPurple,
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: 'Partners',
              backgroundColor: Colors.deepPurple,
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              label: 'Settings',
              backgroundColor: Colors.deepPurple,
              // backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 28),
          onTap: _onItemTapped,
        ));
  }
}

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 48,
              //     backgroundImage: NetworkImage(
              //         "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=194"),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Location: ",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Surat",
                      style: GoogleFonts.lato(
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
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FeatureComponent(
                  icon: Icons.work,
                  text: "Co-Working",
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => GridBooking()));
                  },
                  startColor: Color.fromRGBO(156, 161, 227, 1),
                  endColor: Color.fromRGBO(182, 241, 220, 1),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                FeatureComponent(
                  icon: Icons.event,
                  text: "Organize Events",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EventFormScreen()));
                  },
                  startColor: Color.fromRGBO(156, 161, 227, 1),
                  endColor: Color.fromRGBO(182, 241, 220, 1),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                FeatureComponent(
                  icon: Icons.work,
                  text: "Request Event",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => requestEventScreen()));
                  },
                  startColor: Color.fromRGBO(156, 161, 227, 1),
                  endColor: Color.fromRGBO(182, 241, 220, 1),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Upcoming Events",
              style: GoogleFonts.lato(
                  color: Color.fromRGBO(5, 1, 82, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ), // 2 min ho
          ),
          Flexible(
            child: Obx(() {
              return ListView.builder(
                  itemCount: eventController.listOfEventsOfTwoDays.value.length,
                  itemBuilder: (context, index) {
                    return EventNewsTile(
                      eventDate: eventController
                          .listOfEventsOfTwoDays[index].eventDate,
                      eventName: eventController
                          .listOfEventsOfTwoDays[index].eventName,
                      event: eventController.listOfEventsOfTwoDays[index],
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}
