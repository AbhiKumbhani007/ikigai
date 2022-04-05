import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ikigai/screens/components/eventnews_component.dart';
import 'package:ikigai/screens/my_bookings/qr_code_generator.dart';

import '../../controllers/booking_controller.dart';

class MyBooking extends StatelessWidget {
  MyBooking({Key? key}) : super(key: key);
  BookingController bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    bookingController.getBooking();
    return Obx(() {
      return ListView.builder(
          itemCount: bookingController.listOfMyBooking.value.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeGenerator(
                        bookingModel:
                            bookingController.listOfMyBooking.value[index]),
                  ),
                );
              },
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
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
                    // Image.network("https://picsum.photos/100?image=9"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (bookingController
                                        .listOfMyBooking.value[index].event !=
                                    null)
                                ? "${bookingController.listOfMyBooking.value[index].event!.eventName}"
                                : "Co-Working Space Booking",
                            style: GoogleFonts.prompt(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(5, 1, 82, 1)),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            (bookingController
                                        .listOfMyBooking.value[index].event !=
                                    null)
                                ? "${bookingController.listOfMyBooking.value[index].event!.eventDate}"
                                : "Co-Working Space",
                            style: GoogleFonts.prompt(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 166, 87, 240)),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
