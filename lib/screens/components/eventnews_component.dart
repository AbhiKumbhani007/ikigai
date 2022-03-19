import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/screens/Events/event_detail_screen.dart';
import 'package:share/share.dart';
import "../../constants/flutter_flow_theme.dart";
import '../../models/event_model.dart';
import 'package:ikigai/main.dart';

import '../../services/paymen_services.dart';

class EventNewsTile extends StatelessWidget {
  var eventName;
  var eventDate;
  EventModel? event;
  EventNewsTile({
    Key? key,
    this.event,
    this.eventName,
    this.eventDate,
  }) : super(key: key);
  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // i want to navigate to EventDeatilsScreen

      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => EventDetailsScreen(
                      event: event,
                    ))));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      eventName,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      eventDate,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "${event!.ticketPrice} Rs.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        height: 40,
                        width: 100,
                        child: Column(
                          children: [
                            ElevatedButton(
                              child: Text("Share"),
                              onPressed: () {
                                Share.share(
                                    "Check out this event ${event!.eventName}");
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                registerEvent(event!);
                                eventController.bookEvent(event!);
                              },
                              child: const Text("Book"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
