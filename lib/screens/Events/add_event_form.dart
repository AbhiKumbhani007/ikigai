// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikigai/screens/components/gridbooking.dart';
import 'package:ikigai/services/event_services.dart';

import '../../controllers/matrix_controller.dart';
import '../../services/payment_services.dart';
import '../components/formfield.dart';
import '../components/input_field_date.dart';
import '../components/input_text_field.dart';

class EventFormScreen extends StatefulWidget {
  const EventFormScreen({Key? key}) : super(key: key);

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

enum SingingCharacter { Public, Private }

class _EventFormScreenState extends State<EventFormScreen> {
  final TextEditingController _eventName = TextEditingController();
  final TextEditingController _totalSeats = TextEditingController();
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _endTime = TextEditingController();
  final TextEditingController _eventType = TextEditingController();
  final TextEditingController _ticketPrice = TextEditingController();
  final TextEditingController _discription = TextEditingController();
  final TextEditingController _publishType = TextEditingController();

  DateTime date = DateTime.now();
  final TextEditingController _date = TextEditingController(
      text:
          "${((DateTime.now().day + 1) < 10 ? '0' + (DateTime.now().day + 1).toString() : (DateTime.now().day + 1).toString()) + '-' + (DateTime.now().month < 10 ? '0' + DateTime.now().month.toString() : DateTime.now().month.toString()) + '-' + DateTime.now().year.toString()}");

  final _formKey3 = GlobalKey<FormState>();
  TimeOfDay selectedTime = TimeOfDay.now();

  MatrixController matrixController = Get.find();

  String dropdownValue = 'Full-Day (08:00AM - 08:00PM)';
  SingingCharacter? _character = SingingCharacter.Public;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        // centerTitle: true,
        elevation: 0,
        title: Text("Add Event",
            style: GoogleFonts.prompt(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(183, 183, 198, 1),
                        ),
                      ),
                      InputTextField(
                        fieldName: "Event Name",
                        hintText: "Enter Event Name",
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
                        height: 10,
                      ),
                      InputTextField(
                        fieldName: "Event Discription",
                        hintText: "Enter Event Descirption",
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
                        height: 10,
                      ),
                      InputTextField(
                        fieldName: "Event type",
                        hintText: "e.g. Dancing, Music, Workshop",
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
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1),
                            child: Text("Select Time",
                                style: GoogleFonts.prompt(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromRGBO(34, 34, 82, 1))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: DecoratedBox(
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color.fromRGBO(183, 183, 198, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                child: Container(
                                  width: size.width,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: DropdownButtonHideUnderline(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: DropdownButton<String>(
                                        // isExpanded: true,
                                        value: dropdownValue,
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 30,
                                        ),
                                        style: GoogleFonts.prompt(
                                          color: const Color.fromARGB(
                                              255, 109, 109, 109),
                                        ),
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
                                          '08:00PM - 12:00AM',
                                          // 'Public',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.prompt(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputFieldDate(
                        inputIcon: Icons.date_range,
                        initialValue: DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day + 1)
                            .toString(),
                        topicName: "Date",
                        size: size,
                        fieldController: _date,
                        hinttext: "Enter Date",
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
                        height: 15,
                      ),
                      Row(
                        children: [
                          InputTextField(
                            fieldName: "No. of People",
                            hintText: "e.g. 25",
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
                          InputTextField(
                            fieldName: "Price",
                            hintText: "Price per seat",
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(183, 183, 198, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.15),
                            child: Text(
                              "Select Publish Type",
                              style: GoogleFonts.prompt(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: ListTile(
                                    title: const Text('Public'),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.Public,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                          _publishType.text = "Public";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: ListTile(
                                    title: const Text('Private'),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.Private,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                          _publishType.text = "Private";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(183, 183, 198, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.85,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Color.fromARGB(201, 87, 95, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80)),
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () async {
                                if (_formKey3.currentState!.validate()) {
                                  saveForm();
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Add Event",
                                style: GoogleFonts.prompt(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
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
    eventDetails["start_time"] = dropdownValue;
    eventDetails["end_time"] = _endTime.text;
    eventDetails["no_of_seats"] = _totalSeats.text;
    eventDetails["ticket_price"] = _ticketPrice.text;
    if (_character == SingingCharacter.Public)
      eventDetails["event_mode"] = "Public";
    else
      eventDetails["event_mode"] = "Private";
    eventDetails["event_desc"] = _discription.text;
    EventServices es = EventServices();
    es.addEventsToFirebase(eventDetails, _date.text);
  }
}
