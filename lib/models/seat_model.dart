import 'package:flutter/material.dart';

class SeatModel {
  bool is1stSlotSelected = false;
  bool is2ndSlotSelected = false;
  bool is3rdSlotSelected = false;
  bool is4thSlotSelected = false;
  String seatCategory = "OFFICE_CHAIR";
  int cnt = 0;

  SeatModel({
    this.is1stSlotSelected = false,
    this.is2ndSlotSelected = false,
    this.is3rdSlotSelected = false,
    this.is4thSlotSelected = false,
    this.seatCategory = "OFFICE_CHAIR",
  });

  int getCnt() {
    if (is1stSlotSelected) {
      cnt++;
    }
    if (is2ndSlotSelected) {
      cnt++;
    }
    if (is3rdSlotSelected) {
      cnt++;
    }
    if (is4thSlotSelected) {
      cnt++;
    }
    return cnt;
  }

  Color getColor() {
    if (getCnt() == 4) return Color.fromARGB(255, 185, 188, 243);
    if (getCnt() == 0) return Color.fromARGB(255, 237, 238, 252);
    return Color.fromARGB(255, 237, 238, 252);
  }

  String getSeatCategory() {
    return seatCategory;
  }
}
