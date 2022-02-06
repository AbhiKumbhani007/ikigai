import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikigai/screens/components/input_field_date.dart';

import '../../controllers/matrix_controller.dart';

class GridBooking extends StatefulWidget {
  const GridBooking({Key? key}) : super(key: key);

  @override
  _GridBookingState createState() => _GridBookingState();
}

class _GridBookingState extends State<GridBooking> {
  MatrixController matrixController = Get.put(MatrixController());
  final TextEditingController _date = TextEditingController();
  int _seatNumber = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid Booking testing"),
      ),
      body: ListView(
        children: [
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
                        ? Colors.amber
                        : Colors.white,
                    child: Center(child: Text('${index + 1}')),
                  );
                }));
              }),

          // render available slotes of selected seat
        ],
      ),
    );
  }
}
