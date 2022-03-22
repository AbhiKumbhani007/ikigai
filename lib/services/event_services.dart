import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:ikigai/controllers/event_controller.dart';
import 'package:ikigai/controllers/user_controller.dart';
import 'package:ikigai/services/payment_services.dart';

import '../models/booking.dart';
import '../models/event_model.dart';

BookingController bookingController = Get.find();

class EventServices {
  UserController userController = Get.find();
  CollectionReference eventsCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Events");

  CollectionReference bookingCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Bookings");

  Future<void> addEventsToFirebase(eventDetails, date) async {
    CollectionReference eventArray =
        await eventsCollection.doc(date).collection("event_array");
    final snapshot = await eventArray.get();
    int lengthOfEventArray = snapshot.docs.length;
    EventModel event = EventModel(
        eventId: date + "_" + (lengthOfEventArray).toString(),
        eventName: eventDetails["event_name"],
        eventType: eventDetails["event_type"],
        startTime: eventDetails["start_time"],
        endTime: eventDetails["end_time"],
        availableSeats: eventDetails["no_of_seats"],
        ticketPrice: eventDetails["ticket_price"],
        eventMode: eventDetails["event_mode"]);
    String paymentDone = await  bookingForOrganizeEvent(event);
    if (paymentDone == "FAILURE") {
      return;
    }
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
    var listOfUserSnapshot = await eventsCollection
        .doc(date)
        .collection("event_array")
        .doc(docNo)
        .get();
    int NumberOfUsersRegistered = listOfUserSnapshot["registered_user"].length;

    var temp = await bookingCollection
        .doc(userController.uid.value)
        .collection("booking_array")
        .get();
    int length = temp.docs.length;

    // implement booking collection logic here
    bookingCollection
        .doc(userController.uid.value)
        .collection("booking_array")
        .doc(length.toString())
        .set({
      "event_id": eventId,
      "booking_id": userController.uid.value + "_" + eventId,
      "date": date,
      "seat_number": 0,
      "slot_number": 0,
    });

    bookingController.getBooking();
  }

  Future<List<EventModel>> FetchAllEvents() async {
    List<EventModel> eventList = [];
    var snapshot = await eventsCollection.get();
    for (int dates = 0; dates < snapshot.docs.length; dates++) {
      var eventArraySnapshot = await eventsCollection
          .doc(snapshot.docs[dates].id)
          .collection("event_array")
          .get();
      for (int event = 0; event < eventArraySnapshot.docs.length; event++) {
        eventList.add(EventModel(
          eventDate: snapshot.docs[dates].id,
          eventId: eventArraySnapshot.docs[event].id,
          eventName: eventArraySnapshot.docs[event]["event_name"],
          eventType: eventArraySnapshot.docs[event]["event_type"],
          startTime: eventArraySnapshot.docs[event]["start_time"],
          endTime: eventArraySnapshot.docs[event]["end_time"],
          availableSeats: eventArraySnapshot.docs[event]["no_of_seats"],
          ticketPrice: eventArraySnapshot.docs[event]["ticket_price"],
          eventMode: eventArraySnapshot.docs[event]["event_mode"],
        ));
      }
    }
    eventList = eventList.where((i) => i.eventMode == "Public").toList();
    return eventList;
  }

  Future<List<BookingModel>> getMyBookings() async {
    List<BookingModel> bookinglist = [];

    String userId = userController.uid.value;
    EventModel? event;
    CollectionReference allBooking =
        bookingCollection.doc(userId).collection("booking_array");
    var snapShot = await allBooking.get();
    for (int i = 0; i < snapShot.docs.length; i++) {
      if (snapShot.docs[i]["event_id"] != "-1") {
        var eventSnapshot = await eventsCollection
            .doc(snapShot.docs[i]["date"].toString())
            .collection("event_array")
            .doc(snapShot.docs[i]["event_id"].toString().substring(11))
            .get();

        event = EventModel(
          eventDate: snapShot.docs[i]["date"].toString(),
          eventId: eventSnapshot["event_id"],
          eventName: eventSnapshot["event_name"],
          eventType: eventSnapshot["event_type"],
          startTime: eventSnapshot["start_time"],
          endTime: eventSnapshot["end_time"],
          availableSeats: eventSnapshot["no_of_seats"],
          ticketPrice: eventSnapshot["ticket_price"],
          eventMode: eventSnapshot["event_mode"],
        );
      } else {
        event = null;
      }

      bookinglist.add(BookingModel(
          date: snapShot.docs[i]["date"],
          eventId: snapShot.docs[i]["event_id"],
          id: snapShot.docs[i]["booking_id"],
          seatNumber: int.parse(snapShot.docs[i]["seat_number"].toString()),
          slotNumber: int.parse(snapShot.docs[i]["slot_number"].toString()),
          event: event));
    }

    return bookinglist;
  }
}
