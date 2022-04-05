import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/flutter_flow_theme.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  var topicName;
  var size;
  var fieldController;
  var validator;
  var inputIcon;
  var keyboardType;
  var minLines;
  var maxLines;
  var hinttext;
  InputField(
      {this.topicName,
      this.size,
      this.fieldController,
      this.validator,
      this.inputIcon,
      this.keyboardType,
      this.maxLines,
      this.minLines,
      this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Container(
      /* 
      color: Colors.black, */
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .08, vertical: size.width * 0.02),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(topicName,
                  style: GoogleFonts.prompt(
                      fontSize: 14, fontWeight: FontWeight.normal))
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.92,
            child: TextFormField(
              controller: fieldController,
              validator: validator,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(
                        color: Color.fromRGBO(45, 201, 235, 1), width: 1.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
/*                     borderRadius: new BorderRadius.circular(25.0), */
                    borderSide:
                        BorderSide(color: Color.fromRGBO(45, 201, 235, 1)),
                  ),
                  hintText: hinttext,
                  hintStyle: GoogleFonts.prompt(
                    color: const Color.fromRGBO(192, 200, 231, 1),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          )
        ],
      ),
    );
  }
}
