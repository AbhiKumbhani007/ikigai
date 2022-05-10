import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/controllers/user_controller.dart';
import 'package:ikigai/services/user_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/booking.dart';

class QRCodeGenerator extends StatefulWidget {
  BookingModel? bookingModel;
  QRCodeGenerator({Key? key, this.bookingModel}) : super(key: key);
  UserController userController = Get.find();
// String userid=userController.uid.toString();
  @override
  State<QRCodeGenerator> createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  @override
  Widget build(BuildContext context) {
    String qrData =
        "UserId: ${userController.uid.value}\nDate: ${widget.bookingModel?.date} \nSeat Number: ${widget.bookingModel?.seatNumber} \nSloat Number: ${widget.bookingModel?.slotNumber}";
    (widget.bookingModel?.event != null)
        ? qrData +
            " \nEvent Name: ${widget.bookingModel?.event!.eventName} \nEvent Type: ${widget.bookingModel?.event!.eventType} "
        : "";

    debugPrint(qrData);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: qrData,
              version: QrVersions.auto,
              size: 200,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
            leading: SizedBox(
              width: 130,
              child: Text("Seat number: ",
                  style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              ("${widget.bookingModel?.seatNumber}" != "0")
                  ? "${widget.bookingModel?.seatNumber}"
                  : "Not Avilable",
              style: GoogleFonts.prompt(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
            leading: SizedBox(
              width: 130,
              child: Text("Slot number: ",
                  style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              ("${widget.bookingModel?.slotNumber}" != "0")
                  ? "${widget.bookingModel?.slotNumber}"
                  : "Not Avilable",
              style: GoogleFonts.prompt(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
            leading: SizedBox(
              width: 130,
              child: Text("Booking Date: ",
                  style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              "${widget.bookingModel?.date}",
              style: GoogleFonts.prompt(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Event Name:",
                        style: GoogleFonts.prompt(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.eventName}",
                    style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : SizedBox(),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Category:",
                        style: GoogleFonts.prompt(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.eventType}",
                    style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : SizedBox(),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Price:",
                        style: GoogleFonts.prompt(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.ticketPrice} Rs.",
                    style: GoogleFonts.prompt(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
