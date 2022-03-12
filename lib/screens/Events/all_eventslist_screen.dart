import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/event_controller.dart';
import '../components/eventnews_component.dart';

class AllEvents extends StatefulWidget {
  AllEvents({Key? key}) : super(key: key);

  @override
  State<AllEvents> createState() => AllEventsState();
}

class AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    EventController eventController = Get.find();
    return Obx(() {
      return ListView.builder(
          itemCount: eventController.listOfEvents.value.length,
          itemBuilder: (context, index) {
            return EventNewsTile(
              eventDate: eventController.listOfEvents[index].eventDate,
              eventName: eventController.listOfEvents[index].eventName,
              event: eventController.listOfEvents[index],
            );
          });
    });
  }
}
