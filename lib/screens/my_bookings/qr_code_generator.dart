import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/booking.dart';

class QRCodeGenerator extends StatefulWidget {
  BookingModel? bookingModel;
  QRCodeGenerator({Key? key, this.bookingModel}) : super(key: key);

  @override
  State<QRCodeGenerator> createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  @override
  Widget build(BuildContext context) {
    String qrData =
        "Date: ${widget.bookingModel?.date} \nSeat Number: ${widget.bookingModel?.seatNumber} \nSloat Number: ${widget.bookingModel?.slotNumber}";
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
            contentPadding: const EdgeInsets.only(left: 30),
            leading: SizedBox(
              width: 130,
              child: Text("Seat number: ",
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              ("${widget.bookingModel?.seatNumber}" != "0")
                  ? "${widget.bookingModel?.seatNumber}"
                  : "Not Avilable",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30),
            leading: SizedBox(
              width: 130,
              child: Text("Slot number: ",
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              ("${widget.bookingModel?.slotNumber}" != "0")
                  ? "${widget.bookingModel?.slotNumber}"
                  : "Not Avilable",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30),
            leading: SizedBox(
              width: 130,
              child: Text("Booking Date: ",
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple)),
            ),
            title: Text(
              "${widget.bookingModel?.date}",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Event Name:",
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.eventName}",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : SizedBox(),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Category:",
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.eventType}",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : SizedBox(),
          (widget.bookingModel?.event != null)
              ? ListTile(
                  contentPadding: const EdgeInsets.only(left: 30),
                  leading: SizedBox(
                    width: 130,
                    child: Text("Price:",
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple)),
                  ),
                  title: Text(
                    "${widget.bookingModel?.event!.ticketPrice} Rs.",
                    style: GoogleFonts.poppins(
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
