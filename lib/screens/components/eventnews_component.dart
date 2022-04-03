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
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: const Color.fromRGBO(167, 171, 240, 1),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${eventName}",
                          style: GoogleFonts.prompt(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              Share.share(
                                  "Check out this event ${event!.eventName}");
                            },
                            icon: const Icon(
                              Icons.more_vert_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          " ${eventDate}",
                          style: GoogleFonts.prompt(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₹ ${event!.ticketPrice}",
                            style: GoogleFonts.prompt(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height * 0.02,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: () {
                                  registerEvent(event!);
                                  eventController.bookEvent(event!);
                                },
                                child: Text("Book",
                                    style: GoogleFonts.lato(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: const Color.fromRGBO(
                                            34, 34, 82, 1)))),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        // Card(
        //     elevation: 2,
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.only(left: 15.0),
        //             child: Column(
        //               // mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.only(top: 10.0),
        //                   child: Text(
        //                     "Event: ${eventName}",
        //                     style: GoogleFonts.lato(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.w600,
        //                     ),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(top: 10.0),
        //                   child: Text(
        //                     "Date: ${eventDate}",
        //                     style: GoogleFonts.lato(
        //                       fontSize: 15,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   width: MediaQuery.of(context).size.width * 0.25,
        //                   child: Text(
        //                     "Price: ${event!.ticketPrice} Rs.",
        //                     style: GoogleFonts.lato(
        //                       fontSize: 15,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           flex: 2,
        //         ),
        //         Expanded(
        //           child: Column(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 5.0),
        //                 child: ElevatedButton(
        //                   child: Text(
        //                     "Share",
        //                     style: GoogleFonts.lato(
        //                         fontSize: 14, fontWeight: FontWeight.w600),
        //                   ),
        //                   onPressed: () {
        //                     Share.share(
        //                         "Check out this event ${event!.eventName}");
        //                   },
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(bottom: 5.0),
        //                 child: ElevatedButton(
        //                   onPressed: () {
        //                     registerEvent(event!);
        //                     eventController.bookEvent(event!);
        //                   },
        //                   child: Text("Book",
        //                       style: GoogleFonts.lato(
        //                           fontSize: 14, fontWeight: FontWeight.w600)),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           flex: 1,
        //         ),
        //       ],
        //     )),
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