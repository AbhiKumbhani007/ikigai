import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/matrix_controller.dart';
import 'package:ikigai/controllers/user_controller.dart';
import '../models/seat_model.dart';

class MatrixServices {
  MatrixController matrixController = Get.find();
  UserController userController = Get.find();
  CollectionReference matrixCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Matrix");

  CollectionReference bookingCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Bookings");

  CollectionReference bookingHashTable = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("booking_for_admin");

  Future<void> getSeatStats(String seatNumber, String date) async {
    CollectionReference dateCollection =
        matrixCollection.doc(date).collection(seatNumber);
    final snapShots = await dateCollection.get();
    if (snapShots.docs.length > 0) {
      // fetch the data and list the available slots
      for (int i = 0; i < snapShots.docs.length - 1; i++) {
        matrixController.timeSlots[int.parse(snapShots.docs[i].id.toString())] =
            snapShots.docs[i]["is_booked"];
      }
      for (int i = 0; i < 4; i++) {
        debugPrint(
            "matrixController.timeSlots[$i] : ${matrixController.timeSlots[i]}");
      }
    } else {
      // implement whole collection
      for (int i = 0; i < 4; i++) {
        dateCollection.doc("${i}").set({'is_booked': false});
      }
      for (int i = 0; i <= 3; i++) {
        matrixController.timeSlots[i] = false;
      }
    }
  }

  Future<List<SeatModel>> getSeatStatsAccordingToDate(String date) async {
    // if date is not present in the collection then create the whole matrix there
    // and fetch the data
    // in matrix collection go with date and then go with seat number
    // var MatrixOfDate = await matrixCollection.doc(date);
    List<SeatModel> seats = [];
    CollectionReference col = await FirebaseFirestore.instance
        .collection("Location")
        .doc("Nalagandla")
        .collection("Matrix")
        .doc(date)
        .collection("1");
    var snapShots = await col.get();
    if (snapShots.docs.length > 0) {
      // fetch the data
      for (int i = 1; i <= 64; i++) {
        SeatModel sm = SeatModel();
        var snap = await matrixCollection.doc(date).collection("$i").get();
        sm.is1stSlotSelected = snap.docs[0]["is_booked"];
        sm.is2ndSlotSelected = snap.docs[1]["is_booked"];
        sm.is3rdSlotSelected = snap.docs[2]["is_booked"];
        sm.is4thSlotSelected = snap.docs[3]["is_booked"];
        seats.add(sm);
      }
    } else {
      // make the collection
      for (int i = 1; i <= 64; i++) {
        SeatModel sm = SeatModel();
        matrixCollection
            .doc(date)
            .collection("$i")
            .doc("0")
            .set({'is_booked': false});
        matrixCollection
            .doc(date)
            .collection("$i")
            .doc("1")
            .set({'is_booked': false});
        matrixCollection
            .doc(date)
            .collection("$i")
            .doc("2")
            .set({'is_booked': false});
        matrixCollection
            .doc(date)
            .collection("$i")
            .doc("3")
            .set({'is_booked': false});
        sm.is1stSlotSelected = false;
        sm.is2ndSlotSelected = false;
        sm.is3rdSlotSelected = false;
        sm.is4thSlotSelected = false;
        seats.add(sm);
      }
    }
    return seats;
    // else only fetch the data
  }

  Future<void> bookSeatInFirebase(
      String seatNumber, String date, int index) async {
    String bookingId = date + "_" + seatNumber + "_" + index.toString();
    var temp = await bookingCollection
        .doc(userController.uid.value)
        .collection("booking_array")
        .get();
    int length = temp.docs.length;
    bookingCollection
        .doc(userController.uid.value)
        .collection("booking_array")
        .doc(length.toString())
        .set({
      "booking_id": bookingId,
      "date": date,
      "event_id": "-1",
      "seat_number": seatNumber,
      "slot_number": index.toString(),
    });
    if (index == 4) {
      matrixCollection
          .doc(date)
          .collection(seatNumber)
          .doc("0".toString())
          .set({
        "is_booked": true,
        "user_id": userController.uid.value,
        "booking_id": bookingId
      });
      matrixCollection
          .doc(date)
          .collection(seatNumber)
          .doc("1".toString())
          .set({
        "is_booked": true,
        "user_id": userController.uid.value,
        "booking_id": bookingId
      });
      matrixCollection
          .doc(date)
          .collection(seatNumber)
          .doc("2".toString())
          .set({
        "is_booked": true,
        "user_id": userController.uid.value,
        "booking_id": bookingId
      });
    } else {
      matrixCollection
          .doc(date)
          .collection(seatNumber)
          .doc(index.toString())
          .set({
        "is_booked": true,
        "user_id": userController.uid.value,
        "booking_id": bookingId
      });
    }
    // bookingHashTable.matrixController.getSeatStatsAccordingToDate();
  }
}
