import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/matrix_services.dart';

class MatrixController extends GetxController {
  RxInt seatNumber = 0.obs;
  String selectedDate = "";
  RxList<bool> timeSlots = RxList<bool>();
  MatrixServices matrixService = MatrixServices();
  @override
  void onInit() {
    for (int i = 0; i < 13; i++) {
      timeSlots.add(false);
    }
    super.onInit();
  }

  // void setSeatNumber(int seat) {
  //   seatNumber = seat as RxInt;
  // }

  void setSelectedDate(String date) {
    debugPrint("inside setSelectedDate");
    selectedDate = date;
    debugPrint("${selectedDate}");
  }

  void fetchSeatDetailsFromFirebase() {
    matrixService.getSeatStats(seatNumber.value.toString(), selectedDate);
  }
}
