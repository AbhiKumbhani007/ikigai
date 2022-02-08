import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/event_model.dart';

class EventController extends GetxController {
  var listOfEvents = <EventModel>[].obs;
}
