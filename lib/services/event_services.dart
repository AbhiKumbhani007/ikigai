import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      "event_mode": eventDetails["event_mode"]
    });
    EventController eventController = Get.find();
    eventController.fetchNextTwoDaysEvent();
  }

  Future<List<EventModel>> FetchNextTwoDaysEvents() async {
    String today =
        "${((DateTime.now().day) < 10 ? '0' + (DateTime.now().day).toString() : (DateTime.now().day).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String nextDate =
        "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after2days =
        "${((DateTime.now().day + 2) < 10 ? '0' + (DateTime.now().day + 2).toString() : (DateTime.now().day + 2).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after3days =
        "${((DateTime.now().day + 3) < 10 ? '0' + (DateTime.now().day + 3).toString() : (DateTime.now().day + 3).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after4days =
        "${((DateTime.now().day + 4) < 10 ? '0' + (DateTime.now().day + 4).toString() : (DateTime.now().day + 4).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after5days =
        "${((DateTime.now().day + 5) < 10 ? '0' + (DateTime.now().day + 5).toString() : (DateTime.now().day + 5).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after6days =
        "${((DateTime.now().day + 6) < 10 ? '0' + (DateTime.now().day + 6).toString() : (DateTime.now().day + 6).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";
    String after7days =
        "${((DateTime.now().day + 7) < 10 ? '0' + (DateTime.now().day + 7).toString() : (DateTime.now().day + 7).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}";

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
        eventMode: snapshot.docs[i]["event_mode"],
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
        eventMode: snapshot.docs[i]["event_mode"],
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
        eventMode: snapshot.docs[i]["event_mode"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after3days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after3days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
        eventMode: snapshot.docs[i]["event_mode"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after4days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after4days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
        eventMode: snapshot.docs[i]["event_mode"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after5days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after5days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
        eventMode: snapshot.docs[i]["event_mode"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after6days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after6days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        eventMode: snapshot.docs[i]["event_mode"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
      ));
    }
    eventArray =
        await eventsCollection.doc(after7days).collection("event_array");
    snapshot = await eventArray.get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      eventList.add(EventModel(
        eventDate: after7days,
        eventId: snapshot.docs[i]["event_id"],
        eventName: snapshot.docs[i]["event_name"],
        eventType: snapshot.docs[i]["event_type"],
        startTime: snapshot.docs[i]["start_time"],
        endTime: snapshot.docs[i]["end_time"],
        availableSeats: snapshot.docs[i]["no_of_seats"],
        eventMode: snapshot.docs[i]["event_mode"],
        ticketPrice: snapshot.docs[i]["ticket_price"],
      ));
    }

    eventList = eventList.where((i) => i.eventMode == "Public").toList();
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

  Future<List<EventModel>> FetchAllEvents() async {
    List<EventModel> eventList = [];

    eventsCollection.get().then((querySnapshot) => {
          querySnapshot.docs.forEach((doc) async {
            CollectionReference eventArray =
                await eventsCollection.doc(doc.id).collection("event_array");
            var snapshot = await eventArray.get();
            for (int i = 0; i < snapshot.docs.length; i++) {
              eventList.add(EventModel(
                eventDate: doc.id,
                eventId: snapshot.docs[i]["event_id"],
                eventName: snapshot.docs[i]["event_name"],
                eventType: snapshot.docs[i]["event_type"],
                startTime: snapshot.docs[i]["start_time"],
                endTime: snapshot.docs[i]["end_time"],
                availableSeats: snapshot.docs[i]["no_of_seats"],
                eventMode: snapshot.docs[i]["event_mode"],
                ticketPrice: snapshot.docs[i]["ticket_price"],
              ));
            }
          })
        });

    // QuerySnapshot sp = await eventsCollection.get();

    // eventsCollection.get().then((sp) async {
    //   for (int i = 0; i < sp.docs.length; i++) {
    //     var eventArray =
    //         eventsCollection.doc(sp.docs[i].id).collection("event_array");
    //     var snapshot = await eventArray.get();
    //     debugPrint("inside fetch all events");
    //     for (int i = 0; i < snapshot.docs.length; i++) {
    //       eventList.add(EventModel(
    //         eventDate: sp.docs[i].id, //sp.docs[i].id,
    //         eventId: snapshot.docs[i]["event_id"],
    //         eventName: snapshot.docs[i]["event_name"],
    //         eventType: snapshot.docs[i]["event_type"],
    //         startTime: snapshot.docs[i]["start_time"],
    //         endTime: snapshot.docs[i]["end_time"],
    //         availableSeats: snapshot.docs[i]["no_of_seats"],
    //         eventMode: snapshot.docs[i]["event_mode"],
    //         ticketPrice: snapshot.docs[i]["ticket_price"],
    //       ));
    //     }
    //   }
    // });

    debugPrint("inside fetch all events");

    eventList = eventList.where((i) => i.eventMode == "Public").toList();
    return eventList;
  }
}
