import 'package:flutter/material.dart';
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
          title: const Text('Request Event'),
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
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                          topicName: "Request Name",
                          hinttext: "Enter Requesting Event Name",
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
                        // InputField(
                        //   topicName: "Total Intrested People ",
                        //   hinttext: "e.g. 5",
                        //   size: size,
                        //   fieldController: _totalSeats,
                        //   validator: (v) {
                        //     if (v!.length == 0) {
                        //       return 'Enter title';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),

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
                                eventForm();
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
        ));
  }

  void eventForm() async {
    var requestDetails = {};
    requestDetails[""] = _eventName.text;
    
    RequestEvent re = RequestEvent();
    re.addRequestToFirebase();
  }
}
