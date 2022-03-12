import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/screens/Events/event_detail_screen.dart';
import "../../constants/flutter_flow_theme.dart";
import '../../models/event_model.dart';

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
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x39000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network("https://picsum.photos/100?image=9"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(5, 1, 82, 1)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    event!.eventDate!,
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(216, 216, 216, 1)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(" ${event?.ticketPrice} \$ ",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(194, 100, 255, 1))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  eventController.bookEvent(event!);
                },
                child: const Text("Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
