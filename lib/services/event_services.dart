import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/controllers/user_controller.dart';

import '../models/event_model.dart';

class EventServices {
  UserController userController = Get.find();
  CollectionReference eventsCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Events");

  Future<void> addEventsToFirebase(eventDetails, date) async {
    CollectionReference eventArray =
        await eventsCollection.doc(date).collection("event_array");
    final snapshot = await eventArray.get();
    int lengthOfEventArray = snapshot.docs.length;
    eventDetails["event_id"] = date + "_" + (lengthOfEventArray).toString();
    eventArray.doc((lengthOfEventArray).toString()).set({
      "event_id": eventDetails["event_id"],
      "event_name": eventDetails["event_name"],
      "event_type": eventDetails["event_type"],
      "start_time": eventDetails["start_time"],
      "end_time": eventDetails["end_time"],
      "no_of_seats": eventDetails["no_of_seats"],
      "ticket_price": eventDetails["ticket_price"],
    });
  }

  Future<List<EventModel>> FetchNextTwoDaysEvents() async {
    String today =
        "${((DateTime.now().day) < 10 ? '0' + (DateTime.now().day).toString() : (DateTime.now().day).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String nextDate =
        "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after2days =
        "${((DateTime.now().day + 2) < 10 ? '0' + (DateTime.now().day + 2).toString() : (DateTime.now().day + 2).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    List<EventModel> eventList = [];
    CollectionReference eventArray =
        await eventsCollection.doc(nextDate).collection("event_array");
    var snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: nextDate,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
      ));
    }

    eventArray = await eventsCollection.doc(today).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: today,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after2days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after2days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
      ));
    }
    return eventList;
  }

  Future<void> addUserIdIntoEvent(EventModel event) async {
    String date = event.eventDate!;
    String eventId = event.eventId!;
    String docNo = eventId[eventId.length - 1];
    eventsCollection.doc(date).collection("event_array").doc(docNo).set({
      "registered_user": FieldValue.arrayUnion([userController.uid.value])
    }, SetOptions(merge: true));
  }

  
}
