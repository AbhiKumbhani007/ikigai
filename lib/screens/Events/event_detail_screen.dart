import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/models/event_model.dart';

import '../../services/paymen_services.dart';

class EventDetailsScreen extends StatelessWidget {
  EventModel? event;
  EventDetailsScreen({Key? key, this.event}) : super(key: key);
  // event avi gya che barober
  @override
  Widget build(BuildContext context) {
    EventController eventController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text('Event Details'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.6),
              child: Image(
                  image: NetworkImage(
                      "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg")),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              leading: SizedBox(
                width: 60,
                child: Text("Name:",
                    style:
                        GoogleFonts.roboto(fontSize: 20, color: Colors.black)),
              ),
              title: Text(
                "${event!.eventName}",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              leading: SizedBox(
                width: 60,
                child: Text("Type:",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              title: Text(
                "${event!.eventType}",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              leading: SizedBox(
                width: 60,
                child: Text("Date:",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              title: Text(
                "${event!.eventDate}",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              leading: SizedBox(
                width: 60,
                child: Text("Seats:",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              title: Text(
                "${event!.availableSeats}",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              leading: SizedBox(
                width: 60,
                child: Text("Price:",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              title: Text(
                "${event!.ticketPrice}",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  registerEvent(event!);
                  eventController.bookEvent(event!);
                },
                child: const Text("Book Event"),
                style: const ButtonStyle())
          ],
        ));
  }
}
