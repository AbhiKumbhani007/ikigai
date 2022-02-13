import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/matrix_controller.dart';

class MatrixServices {
  MatrixController matrixController = Get.find();
  CollectionReference matrixCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Matrix");

  Future<void> getSeatStats(String seatNumber, String date) async {
    CollectionReference dateCollection =
        matrixCollection.doc(seatNumber).collection(date);
    final snapShots = await dateCollection.get();
    if (snapShots.docs.length > 0) {
      // fetch the data and list the available slots
      // debugPrint("")
      for (int i = 0; i < snapShots.docs.length; i++) {
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

  Future<void> bookSeatInFirebase(
      String seatNumber, String date, int index) async {
    if (index == 4) {
      matrixCollection
          .doc(seatNumber)
          .collection(date)
          .doc("0".toString())
          .set({"is_booked": true});
      matrixCollection
          .doc(seatNumber)
          .collection(date)
          .doc("1".toString())
          .set({"is_booked": true});
      matrixCollection
          .doc(seatNumber)
          .collection(date)
          .doc("2".toString())
          .set({"is_booked": true});
    } else {
      matrixCollection
          .doc(seatNumber)
          .collection(date)
          .doc(index.toString())
          .set({"is_booked": true});
    }
  }
}
