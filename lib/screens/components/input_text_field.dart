import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatelessWidget {
  var hintText;
  var fieldName;
  var fieldController;
  var size;
  var validator;
  var obsecure;
  InputTextField(
      {Key? key,
      this.hintText,
      this.fieldName,
      this.fieldController,
      this.size,
      this.validator,
      this.obsecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Text(fieldName,
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: TextFormField(
              obscureText: obsecure,
              controller: fieldController,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.width * 0.05),
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
