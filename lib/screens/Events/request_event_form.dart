import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/request_event_service.dart';
import '../components/formfield.dart';

class requestEventScreen extends StatefulWidget {
  const requestEventScreen({Key? key}) : super(key: key);

  @override
  _requestEventScreenState createState() => _requestEventScreenState();
}

class _requestEventScreenState extends State<requestEventScreen> {
  final TextEditingController _eventName = TextEditingController();
  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Request Event',
              style: GoogleFonts.prompt(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey3,
                  child: Column(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: Text("Request Event",
                                style: GoogleFonts.prompt(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: TextFormField(
                                // initialValue: initialValue,
                                // controller: fieldController,
                                validator: (v) {
                                  if (v!.length == 0) {
                                    return 'Enter title';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              125, 183, 183, 198)),
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.028),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(183, 183, 198, 1),
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(80)),
                                    hintText: "Enter Requesting Event Name",
                                    hintStyle: GoogleFonts.prompt(
                                        fontSize: 15,
                                        color: const Color.fromARGB(
                                            255, 109, 109, 109)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          // InputField(
                          //   topicName: "Request Name",
                          //   hinttext: "Enter Requesting Event Name",
                          //   size: size,
                          //   fieldController: _eventName,
                          //   validator: (v) {
                          //     if (v!.length == 0) {
                          //       return 'Enter title';
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey3.currentState!.validate()) {
                            eventForm();
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text('Add Request',
                            style: GoogleFonts.prompt(
                              fontSize: 18,
                            )),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromRGBO(167, 171, 240, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            fixedSize: const Size(350, 60),
                            textStyle: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void eventForm() async {
    var requestDetails = {};
    requestDetails[""] = _eventName.text;

    RequestEvent re = RequestEvent();
    re.addRequestToFirebase();
  }
}
