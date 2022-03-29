// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/screens/components/input_field_date.dart';
import '../../controllers/matrix_controller.dart';
import '../../services/matrix_services.dart';
import '../../services/payment_services.dart';

class GridBooking extends StatefulWidget {
  GridBooking({Key? key}) : super(key: key);

  @override
  _GridBookingState createState() => _GridBookingState();
}

class _GridBookingState extends State<GridBooking> {
  MatrixController matrixController = Get.find();
  String dropdownValue = 'Full-Day (08:00AM - 08:00PM)';
  DateTime date = DateTime.now();
  bool isSlotsDetailsAvailable = false;
  MatrixServices matrixServices = MatrixServices();
  final TextEditingController _date = TextEditingController(
      text:
          "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}");
  int _seatNumber = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Co-Working Space Booking",
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            matrixController.seatNumber.value = 0;
          },
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              InputFieldDate(
                inputIcon: Icons.date_range,
                initialValue: DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 1)
                    .toString(),
                topicName: "",
                size: size * 0.6,
                fieldController: _date,
                hinttext: "01-01-2020",
                validator: (v) {
                  if (v!.length == 0) {
                    return 'Enter title of activity';
                  } else {
                    return null;
                  }
                },
                onpressed: () async {
                  final date = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                      context: context);
                  if (date != null) {
                    _date.text =
                        // ignore: unnecessary_string_interpolations
                        "${((date.day) < 10 ? '0' + (date.day).toString() : (date.day).toString()) + '-' + (date.month < 10 ? '0' + date.month.toString() : date.month.toString()) + '-' + date.year.toString()}";
                  }
                },
              ),
              SizedBox(
                height: 60,
                child: Center(
                  child: ElevatedButton(
                    onPressed: (() {
                      matrixController.selectedDate = _date.text;
                      matrixController.getSeatStatsAccordingToDate();
                      setState(() {
                        isSlotsDetailsAvailable = true;
                      });
                      // matrixServices.getSeatStatsAccordingToDate(_date.text);
                    }),
                    child: Text(
                      "Fetch Slots",
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // (isSlotsDetailsAvailable)
          //     ?
          GridView.builder(
              shrinkWrap: true, //must for grid inside column
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemCount: 64,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(onTap: () {
                  setState(() {
                    _seatNumber = index + 1;
                    debugPrint("date: ${_date.text}");
                    matrixController.selectedDate = _date.text;
                    debugPrint(
                        "matrixController.selectedDate: ${matrixController.selectedDate}");
                    matrixController.seatNumber.value = _seatNumber;
                    matrixController.fetchSeatDetailsFromFirebase();
                  });
                  debugPrint("${(index / 8).floor() + 1} , ${1 + index % 8}");
                }, child: Obx(() {
                  return Card(
                    color: (index + 1 == matrixController.seatNumber.value)
                        ? Colors.white
                        : matrixController.MatrixStatsOfThisDate.value.length ==
                                0
                            ? Colors.white
                            : matrixController.MatrixStatsOfThisDate[index]
                                .getColor(),
                    child: Center(child: Text('${index + 1}')),
                  );
                }));
              }),
          // : SizedBox(),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              (matrixController.seatNumber.value != 0)
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: 250,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              // isExpanded: true,
                              value: dropdownValue,
                              // icon: const Icon(Icons.arrow_downward),
                              style: GoogleFonts.lato(
                                color: Colors.deepPurple,
                              ),
                              //
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Full-Day (08:00AM - 08:00PM)',
                                '8:00AM - 12:00PM',
                                '12:00PM - 04:00PM',
                                '04:00PM - 08:00PM',
                                "08:00PM - 12:00AM"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 5,
              ),
              Obx(() {
                return (matrixController.seatNumber.value != 0)
                    ? (isSlotAvailable(dropdownValue)
                        ? Text(
                            "Not Available",
                            style: GoogleFonts.lato(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 65.0),
                                child: Text("Catagory : Co-Working",
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  // navigator to payment gateway screen
                                  String paymentDone = await registerMatrixSlot(
                                      "100",
                                      matrixController.selectedDate,
                                      matrixController.seatNumber.value
                                          .toString(),
                                      getIndex(dropdownValue).toString());
                                  if (paymentDone == "SUCCESS") {
                                    matrixController
                                        .bookSeat(getIndex(dropdownValue));
                                  } else {
                                    // payment is failed so please do that again
                                  }
                                },
                                child: Text("Book",
                                    style: GoogleFonts.lato(fontSize: 16)),
                              ),
                            ],
                          ))
                    : SizedBox();
              })
            ],
          ),
        ],
      ),
    );
  }

  bool isSlotAvailable(String slot) {
    if (slot == 'Full-Day (08:00AM - 08:00PM)') {
      return matrixController.timeSlots[0] ||
          matrixController.timeSlots[1] ||
          matrixController.timeSlots[2];
    }
    if (slot == '8:00AM - 12:00PM') {
      return matrixController.timeSlots[0];
    }
    if (slot == '12:00PM - 04:00PM') {
      return matrixController.timeSlots[1];
    }
    if (slot == '04:00PM - 08:00PM') {
      return matrixController.timeSlots[2];
    }
    if (slot == '08:00PM - 12:00AM') {
      return matrixController.timeSlots[3];
    }
    return false;
  }

  int getIndex(String slot) {
    if (slot == '8:00AM - 12:00PM') {
      return 0;
    }
    if (slot == '12:00PM - 04:00PM') {
      return 1;
    }
    if (slot == '04:00PM - 08:00PM') {
      return 2;
    }
    if (slot == '08:00PM - 12:00AM') {
      return 3;
    }
    return 4;
  }
}
