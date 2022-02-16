import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/services/event_services.dart';

import '../models/event_model.dart';

class EventController extends GetxController {
  var listOfEventsOfTwoDays = <EventModel>[].obs;

  @override
  void onInit() {
    fetchNextTwoDaysEvent();
    super.onInit();
  }

  void fetchNextTwoDaysEvent() async {
    EventServices es = new EventServices();
    listOfEventsOfTwoDays.value = await es.FetchNextTwoDaysEvents();
  }

  void bookEvent(EventModel event) async {
    EventServices es = new EventServices();
    await es.addUserIdIntoEvent( event); 
  }


  
}
