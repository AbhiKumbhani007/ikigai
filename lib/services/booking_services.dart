import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/booking_controller.dart';
import 'package:ikigai/controllers/user_controller.dart';
import '../models/booking.dart';

class BookingServices {
  UserController userController = Get.find();
  CollectionReference bookingCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Bookings");

  Future<List<BookingModel>> getBookings() async {
  List<BookingModel> listOfBookings= [];
  return listOfBookings;

  }
}
