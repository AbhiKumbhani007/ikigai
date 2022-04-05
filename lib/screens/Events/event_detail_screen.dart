import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/models/event_model.dart';

import '../../services/payment_services.dart';

class EventDetailsScreen extends StatelessWidget {
  EventModel? event;
  EventDetailsScreen({Key? key, this.event}) : super(key: key);
  // event avi gya che barober
  @override
  Widget build(BuildContext context) {
    EventController eventController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text('${event!.eventName}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(
                      "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg")),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Name:",
                      style: GoogleFonts.prompt(
                          fontSize: 20, color: Colors.black)),
                ),
                title: Text(
                  "${event!.eventName}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Type:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.eventType}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Desc:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.eventDescription}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Date:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.eventDate}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Timings:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.startTime}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Seats:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.availableSeats}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                leading: SizedBox(
                  width: 80,
                  child: Text("Price:",
                      style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                title: Text(
                  "${event!.ticketPrice}",
                  style: GoogleFonts.prompt(
                      fontSize: 18,
                      color: Color.fromARGB(255, 143, 140, 223),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 143, 140, 223))),
                      onPressed: () {
                        registerEvent(event!);
                        eventController.bookEvent(event!);
                      },
                      child: Text("Book",
                          style: GoogleFonts.prompt(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 255, 255, 255)))),
                ),
              )
            ],
          ),
        ));
  }
}
