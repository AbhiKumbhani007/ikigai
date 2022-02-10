import 'package:flutter/material.dart';
import 'package:ikigai/screens/components/formfield.dart';
import 'package:ikigai/screens/components/input_field_date.dart';

import '../components/gridbooking.dart';

class CoWorkingScreen extends StatefulWidget {
  const CoWorkingScreen({Key? key}) : super(key: key);

  @override
  _CoWorkingScreenState createState() => _CoWorkingScreenState();
}

class _CoWorkingScreenState extends State<CoWorkingScreen> {
  final TextEditingController _duration = TextEditingController();
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 249, 254, 1),
      appBar: AppBar(
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Co-Working Space",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          InputField(
              topicName: "Duration",
              size: size,
              fieldController: _duration,
              hinttext: "Abcd",
              validator: (v) {
                if (v!.length == 0) {
                  return 'Enter title of activity';
                } else {
                  return null;
                }
              }),
          InputFieldDate(
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
              _date.text =
                  // ignore: unnecessary_string_interpolations
                  "${(date!.day < 10 ? '0' + date.day.toString() : date.day.toString()) + '-' + (date.month < 10 ? '0' + date.month.toString() : date.month.toString()) + '-' + date.year.toString()}";
            },
          ),
          Row(
            children: [
              InputField(
                  topicName: "Duration",
                  size: size / 2,
                  fieldController: _duration,
                  hinttext: "Abcd",
                  validator: (v) {
                    if (v!.length == 0) {
                      return 'Enter title of activity';
                    } else {
                      return null;
                    }
                  }),
              InputField(
                  topicName: "Duration",
                  size: size / 2,
                  fieldController: _duration,
                  hinttext: "Abcd",
                  validator: (v) {
                    if (v!.length == 0) {
                      return 'Enter title of activity';
                    } else {
                      return null;
                    }
                  }),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.app_registration),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => GridBooking()));
        },
      ),
    );
  }
}
