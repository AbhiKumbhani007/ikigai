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

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    MyBooking(),
    AllEvents(),
    PartnerScreen(),
    SettingsScreen(),
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
                    phoneNumber: '+91-9343174119',
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
                    phoneNumber: '+91-9343174119',
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
                    phoneNumber: '+91-9343174119',
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
                    phoneNumber: '+91-9343174119',
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
                    phoneNumber: '+91-9343174119',
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
          automaticallyImplyLeading: false,
          title: Text(
            "Ikigai",
            style: GoogleFonts.prompt(fontSize: 26, color: Colors.white),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/BottomNavbarLogos/home2.png'),
                    // Icons.home_outlined,
                    color: Colors.white,
                    size: 28,
                    // onPressed: () {},
                  ),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(212, 104, 58, 183),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/BottomNavbarLogos/bookmark.png'),
                    // Icons.home_outlined,
                    color: Colors.white,
                    size: 28,
                    // onPressed: () {},
                  ),
                  label: 'Bookings',
                  backgroundColor: Color.fromARGB(212, 104, 58, 183),
                  // backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/BottomNavbarLogos/events.png'),
                    // Icons.home_outlined,
                    color: Colors.white,
                    size: 28,
                    // onPressed: () {},
                  ),
                  label: 'All Events',
                  backgroundColor: Color.fromARGB(212, 104, 58, 183),
                  // backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/BottomNavbarLogos/partners.png'),
                    // Icons.home_outlined,
                    color: Colors.white,
                    size: 28,
                    // onPressed: () {},
                  ),
                  label: 'Partners',
                  backgroundColor: Color.fromARGB(212, 104, 58, 183),
                  // backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/BottomNavbarLogos/settings.png'),
                    // Icons.home_outlined,
                    color: Colors.white,
                    size: 28,
                    // onPressed: () {},
                  ),
                  label: 'Settings',
                  backgroundColor: Color.fromARGB(212, 104, 58, 183),
                  // backgroundColor: Colors.white,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedIconTheme: IconThemeData(size: 28),
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.002),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FeatureComponent(
                    icon: Icons.work_outline_outlined,
                    text: "Co-Working",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => GridBooking()));
                    },
                    startColor: Color.fromRGBO(156, 161, 227, 1),
                    endColor: Color.fromRGBO(182, 241, 220, 1),
                    inCircleColor: const Color.fromARGB(255, 184, 202, 230)),
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
                    startColor: Color.fromARGB(255, 254, 177, 189),
                    endColor: Color.fromARGB(255, 254, 239, 191),
                    inCircleColor: const Color.fromARGB(255, 255, 221, 201)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                FeatureComponent(
                    icon: Icons.event_available_outlined,
                    text: "Request Event",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => requestEventScreen()));
                    },
                    startColor: Color.fromARGB(255, 80, 161, 215),
                    endColor: Color.fromARGB(255, 182, 241, 220),
                    inCircleColor: Color.fromARGB(161, 182, 237, 241)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              "Upcoming Events",
              style: GoogleFonts.prompt(
                  color: Color.fromRGBO(5, 1, 82, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
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
