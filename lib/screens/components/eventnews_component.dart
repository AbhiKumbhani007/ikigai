import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../../constants/flutter_flow_theme.dart";

class EventNewsTile extends StatelessWidget {
  const EventNewsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x39000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network("https://picsum.photos/100?image=9"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dance Classes",
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(5, 1, 82, 1)),
                ),
                const SizedBox(height: 15),
                Text(
                  "Let's dance buddy!!!",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(216, 216, 216, 1)),
                ),
                const SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Price:50 \$ ",
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(194, 100, 255, 1))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              /* height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.22,
            alignment: Alignment.bottomRight, */
              child: ElevatedButton(
            onPressed: () {},
            child: Text("Book"),
          )),
        ],
      ),
    );
  }
}
