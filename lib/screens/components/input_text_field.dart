import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatelessWidget {
  var hintText;
  var fieldName;
  var fieldController;
  var size;
  var validator;
  InputTextField(
      {Key? key,
      this.hintText,
      this.fieldName,
      this.fieldController,
      this.size,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 8.0),
            child: Text(fieldName,
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              controller: fieldController,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                hintStyle: GoogleFonts.prompt(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 109, 109, 109)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(183, 183, 198, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(80)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(125, 183, 183, 198)),
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
