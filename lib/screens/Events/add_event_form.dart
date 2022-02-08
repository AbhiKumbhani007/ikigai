import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/matrix_controller.dart';
import 'package:ikigai/services/event_services.dart';

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
  final TextEditingController _eventId = TextEditingController();
  final TextEditingController _eventType = TextEditingController();
  final TextEditingController _organizerId = TextEditingController();
  final TextEditingController _ticketPrice = TextEditingController();
  DateTime date = DateTime.now();
  final TextEditingController _date = TextEditingController(
      text:
          "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}");

  final _formKey3 = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
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
                      Row(
                        children: [
                          InputFieldDate(
                            inputIcon: Icons.timer,
                            initialValue: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day + 1)
                                .toString(),
                            topicName: "Start Time",
                            size: size / 2,
                            fieldController: _startTime,
                            hinttext: "10:00:00",
                            validator: (v) {
                              if (v!.length == 0) {
                                return 'Enter title of activity';
                              } else {
                                return null;
                              }
                            },
                            onpressed: () async {
                              final date = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context);
                              if (date != null) {
                                // _startTime.text =
                                // ignore: unnecessary_string_interpolations
                                // "${((date.day) < 10 ? '0' + (date.day).toString() : (date.day).toString()) + '-' + (date.month < 10 ? '0' + date.month.toString() : date.month.toString()) + '-' + date.year.toString()}";
                              }
                            },
                          ),
                          InputFieldDate(
                            inputIcon: Icons.timer,
                            initialValue: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day + 1)
                                .toString(),
                            topicName: "End time",
                            size: size / 2,
                            fieldController: _endTime,
                            hinttext: "12:00:00",
                            validator: (v) {
                              if (v!.length == 0) {
                                return 'Enter title of activity';
                              } else {
                                return null;
                              }
                            },
                            onpressed: () async {
                              final date = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context);
                              if (date != null) {
                                // _startTime.text =
                                // ignore: unnecessary_string_interpolations
                                // "${((date.day) < 10 ? '0' + (date.day).toString() : (date.day).toString()) + '-' + (date.month < 10 ? '0' + date.month.toString() : date.month.toString()) + '-' + date.year.toString()}";
                              }
                            },
                          ),
                        ],
                      ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text("Add Event"),
                          style: ButtonStyle(),
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

  void saveForm() async {
    var eventDetails = {};
    eventDetails["event_name"] = _eventName.text;
    eventDetails["event_type"] = _eventType.text;
    eventDetails["start_time"] = _startTime.text;
    eventDetails["end_time"] = _endTime.text;
    eventDetails["no_of_seats"] = _totalSeats.text;
    eventDetails["ticket_price"] = _ticketPrice.text;

    // eventDetails["event_id"] = _eventId;
    // eventDetails["oragnizer_id"] = _organizerId;
    // eventDetails["user_registered"] = ["test"];
    EventServices es = EventServices();
    es.addEventsToFirebase(eventDetails, _date.text);
  }
}
