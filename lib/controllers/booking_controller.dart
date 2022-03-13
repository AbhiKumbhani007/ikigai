import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/services/booking_services.dart';
import 'package:ikigai/services/event_services.dart';

import '../models/booking.dart';

class BookingController extends GetxController {
  var listOfMyBooking = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBooking();
    
  }

  void getBooking() async {
    EventServices bs =EventServices();
    listOfMyBooking.value = await bs.getMyBookings();
  }
}
