import 'package:flutter/material.dart';
import 'package:ikigai/screens/Events/add_event_form.dart';

import 'event_model.dart';

class BookingModel {
  String? id;
  String? date;
  String? eventId;
  int? seatNumber;
  int? slotNumber;
  EventModel? event;
  BookingModel(
      {this.id, this.date, this.eventId, this.seatNumber, this.slotNumber, this.event = null});
}
