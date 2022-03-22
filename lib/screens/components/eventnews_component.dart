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

import '../../services/payment_services.dart';

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
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Event: ${eventName}",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Date: ${eventDate}",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              "Price: ${event!.ticketPrice} Rs.",
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: ElevatedButton(
                            child: Text(
                              "Share",
                              style: GoogleFonts.lato(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Share.share(
                                  "Check out this event ${event!.eventName}");
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: ElevatedButton(
                            onPressed: () {
                              registerEvent(event!);
                              eventController.bookEvent(event!);
                            },
                            child: Text("Book",
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}



// Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10.0),
//           child: Card(
//             elevation: 2,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Text(
//                       eventName, // eventname
//                       style: GoogleFonts.montserrat(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Text(
//                       eventDate, //date
//                       style: GoogleFonts.montserrat(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.2,
//                           child: Text(
//                             "${event!.ticketPrice} Rs.",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 100,
//                       ),
//                       Container(
//                         alignment: Alignment.bottomRight,
//                         height: 40,
//                         width: 150,
//                         child: Row(
//                           children: [
//                             ElevatedButton(
//                               child: Text("Share"),
//                               onPressed: () {
//                                 Share.share(
//                                     "Check out this event ${event!.eventName}");
//                               },
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 registerEvent(event!);
//                                 eventController.bookEvent(event!);
//                               },
//                               child: const Text("Book"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),