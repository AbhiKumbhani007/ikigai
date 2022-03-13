import 'package:flutter/material.dart';
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
    debugPrint("${widget.bookingModel?.eventId}");
    return Scaffold(
      body: Center(
        child: QrImage(
          data: "123",
          version: QrVersions.auto,
          size: 200,
        ),
      ),
    );
  }
}
