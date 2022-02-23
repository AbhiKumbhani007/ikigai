import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/screens/components/gridbooking.dart';
import 'package:ikigai/services/event_services.dart';

import '../../controllers/matrix_controller.dart';
import '../components/formfield.dart';
import '../components/input_field_date.dart';

class EventFormScreen extends StatefulWidget {
  const EventFormScreen({Key? key}) : super(key: key);

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _totalSeats = TextEditingController();
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _endTime = TextEditingController();
  final TextEditingController _eventType = TextEditingController();
  final TextEditingController _ticketPrice = TextEditingController();
  final TextEditingController _discription = TextEditingController();

  DateTime date = DateTime.now();
  final TextEditingController _date = TextEditingController(
      text:
          "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}");

  final _formKey3 = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();

  MatrixController matrixController = Get.find();

  String dropdownValue = 'Full-Day (08:00AM - 08:00PM)';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputField(
                        topicName: "Event Name",
                        hinttext: "Enter Event Name",
                        size: size,
                        fieldController: _eventName,
                        validator: (v) {
                          if (v!.length == 0) {
                            return 'Enter title';
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputField(
                        topicName: "Event Discription",
                        hinttext: "Enter Event Descirption",
                        size: size,
                        fieldController: _discription,
                        validator: (v) {
                          if (v!.length == 0) {
                            return 'Enter title';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                          // height: 2,
                          ),
                      InputField(
                        topicName: "Event type",
                        hinttext: "e.g. Dancing, Music, Workshop",
                        size: size,
                        fieldController: _eventType,
                        validator: (v) {
                          if (v!.length == 0) {
                            return 'Enter title';
                          } else {
                            return null;
                          }
                        },
                      ),
                      InputFieldDate(
                        inputIcon: Icons.date_range,
                        initialValue: DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day + 1)
                            .toString(),
                        topicName: "Date",
                        size: size,
                        fieldController: _date,
                        hinttext: "Abcd",
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
                      // const SizedBox(
                      //   height: 20,
                      //   child: Text("Book Slot"),
                      // ),
                      // (matrixController.seatNumber.value != 0)
                      //     ? Center(
                      //         child: Container(
                      //           width: 300,
                      //           padding: EdgeInsets.symmetric(
                      //               vertical: 5, horizontal: 15),
                      //           child: DropdownButton<String>(
                      //             isExpanded: true,
                      //             value: dropdownValue,
                      //             // icon: const Icon(Icons.arrow_downward),
                      //             style:
                      //                 const TextStyle(color: Colors.deepPurple),
                      //             //
                      //             onChanged: (String? newValue) {
                      //               setState(() {
                      //                 dropdownValue = newValue!;
                      //               });
                      //             },
                      //             items: <String>[
                      //               'Full-Day (08:00AM - 08:00PM)',
                      //               '8:00AM - 12:00PM',
                      //               '12:00PM - 04:00PM',
                      //               '04:00PM - 08:00PM',
                      //               "08:00PM - 12:00PM"
                      //             ].map<DropdownMenuItem<String>>(
                      //                 (String value) {
                      //               return DropdownMenuItem<String>(
                      //                 value: value,
                      //                 child: Container(
                      //                   child: Text(
                      //                     value,
                      //                     style: TextStyle(fontSize: 16),
                      //                   ),
                      //                 ),
                      //               );
                      //             }).toList(),
                      //           ),
                      //         ),
                      //       )
                      //     : SizedBox(),
                      // Obx(() {
                      //   return (isSlotAvailable(dropdownValue)
                      //       ? Center(
                      //           child: Container(
                      //             child: Text("Not Available"),
                      //           ),
                      //         )
                      //       : Center(
                      //           child: ElevatedButton(
                      //             onPressed: () {
                      //               matrixController
                      //                   .bookSeat(getIndex(dropdownValue));
                      //               // navigator to payment gateway screen
                      //             },
                      //             child: Text("Book"),
                      //           ),
                      //         ));
                      // }),
                      Row(
                        children: [
                          InputField(
                            topicName: "Total seats",
                            hinttext: "e.g. 25",
                            size: size / 2,
                            fieldController: _totalSeats,
                            validator: (v) {
                              if (v!.length == 0) {
                                return 'Enter title';
                              } else {
                                return null;
                              }
                            },
                          ),
                          InputField(
                            topicName: "Price",
                            hinttext: "Price per seat",
                            size: size / 2,
                            fieldController: _ticketPrice,
                            validator: (v) {
                              if (v!.length == 0) {
                                return 'Enter title';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                      // InputFieldDate(
                      //   inputIcon: Icons.date_range,
                      //   initialValue: DateTime(DateTime.now().year,
                      //           DateTime.now().month, DateTime.now().day + 1)
                      //       .toString(),
                      //   topicName: "Date",
                      //   size: size,
                      //   fieldController: _date,
                      //   hinttext: "Abcd",
                      //   validator: (v) {
                      //     if (v!.length == 0) {
                      //       return 'Enter title of activity';
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      //   onpressed: () async {
                      //     final date = await showDatePicker(
                      //         initialDate: DateTime.now(),
                      //         firstDate: DateTime.now(),
                      //         lastDate: DateTime(2050),
                      //         context: context);
                      //     if (date != null) {
                      //       _date.text =
                      //           // ignore: unnecessary_string_interpolations
                      //           "${((date.day) < 10 ? '0' + (date.day).toString() : (date.day).toString()) + '-' + (date.month < 10 ? '0' + date.month.toString() : date.month.toString()) + '-' + date.year.toString()}";
                      //     }
                      //   },
                      // ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, "/grid_booking");
                      //     },
                      //     child: Text("Book Slot")),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text("Add Event"),
                          style: const ButtonStyle(),
                          onPressed: () async {
                            if (_formKey3.currentState!.validate()) {
                              saveForm();
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isSlotAvailable(String slot) {
    if (slot == 'Full-Day (08:00AM - 08:00PM)')
      return matrixController.timeSlots[0] ||
          matrixController.timeSlots[1] ||
          matrixController.timeSlots[2];
    if (slot == '8:00AM - 12:00PM') return matrixController.timeSlots[0];
    if (slot == '12:00PM - 04:00PM') return matrixController.timeSlots[1];
    if (slot == '04:00PM - 08:00PM') return matrixController.timeSlots[2];
    if (slot == '8:00AM - 12:00PM') return matrixController.timeSlots[3];
    return false;
  }

  int getIndex(String slot) {
    if (slot == '8:00AM - 12:00PM') return 0;
    if (slot == '12:00PM - 04:00PM') return 1;
    if (slot == '04:00PM - 08:00PM') return 2;
    if (slot == '8:00AM - 12:00PM') return 3;
    return 4;
  }

  void saveForm() async {
    var eventDetails = {};
    eventDetails["event_name"] = _eventName.text;
    eventDetails["event_type"] = _eventType.text;
    eventDetails["start_time"] = _startTime.text;
    eventDetails["end_time"] = _endTime.text;
    eventDetails["no_of_seats"] = _totalSeats.text;
    eventDetails["ticket_price"] = _ticketPrice.text;
    EventServices es = EventServices();
    es.addEventsToFirebase(eventDetails, _date.text);
  }
}
