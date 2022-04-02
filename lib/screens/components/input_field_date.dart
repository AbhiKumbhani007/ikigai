import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/flutter_flow_theme.dart';

// ignore: must_be_immutable
class InputFieldDate extends StatelessWidget {
  var topicName;
  var inputIcon;
  var initialValue;
  var size;
  var fieldController;
  var validator;
  var onpressed;
  var hinttext;
  InputFieldDate(
      {this.topicName,
      this.inputIcon,
      this.initialValue,
      this.size,
      this.fieldController,
      this.validator,
      this.onpressed,
      this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Container(
      /* 
      color: Colors.black, */
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 8.0),
                child: Text(topicName,
                    style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                // initialValue: initialValue,
                controller: fieldController,
                validator: validator,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(125, 183, 183, 198)),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    prefixIcon: IconButton(
                      onPressed: onpressed,
                      icon: Icon(
                        inputIcon,
                        color: Colors.black,
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(183, 183, 198, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(80)),
                    hintText: hinttext,
                    hintStyle: GoogleFonts.prompt(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 109, 109, 109)),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
