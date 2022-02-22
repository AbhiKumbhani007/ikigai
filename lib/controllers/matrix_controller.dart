import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/seat_model.dart';
import '../services/matrix_services.dart';

class MatrixController extends GetxController {
  RxInt seatNumber = 0.obs;
  String selectedDate = "";
  // RxList<bool> timeSlots = RxList<bool>();
  var timeSlots = <bool>[].obs;
  var MatrixStatsOfThisDate = <SeatModel>[].obs;
  @override
  void onInit() {
    for (int i = 0; i < 4; i++) {
      timeSlots.add(false);
    }
    super.onInit();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
  }

  void updateTimeSlots() async {
    MatrixServices matrixService = MatrixServices();
  }

  void fetchSeatDetailsFromFirebase() async {
    MatrixServices matrixService = MatrixServices();
    matrixService.getSeatStats(
        seatNumber.value.toString(), selectedDate.toString());
  }

  void bookSeat(int index) async {
    MatrixServices matrixService = MatrixServices();
    await matrixService.bookSeatInFirebase(
        seatNumber.value.toString(), selectedDate.toString(), index);
    fetchSeatDetailsFromFirebase();
  }

  void getSeatStatsAccordingToDate() async {
    MatrixServices matrixServices = MatrixServices();
    MatrixStatsOfThisDate.value = await matrixServices
        .getSeatStatsAccordingToDate(selectedDate.toString());
  }
}
