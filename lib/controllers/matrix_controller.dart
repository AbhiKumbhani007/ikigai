import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/matrix_services.dart';

class MatrixController extends GetxController {
  RxInt seatNumber = 0.obs;
    String selectedDate = "";
  // RxList<bool> timeSlots = RxList<bool>();
  var timeSlots = <bool>[].obs;

  @override
  void onInit() {
    for (int i = 0; i <= 20; i++) {
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
    // var timeSlots = await matrixService.getS
  }
  // void setSeatNumber(int seat) {
  //   seatNumber = seat as RxInt;
  // }

  // void setSelectedDate(String date) {
  //   debugPrint("inside setSelectedDate");
  //   selectedDate = date;
  //   debugPrint("${selectedDate}");
  // }

  void fetchSeatDetailsFromFirebase()  async {
    MatrixServices matrixService = MatrixServices();
    
  matrixService.getSeatStats(seatNumber.value.toString(), selectedDate.toString());
  }
}
