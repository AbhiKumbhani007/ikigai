import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/flutter_flow_theme.dart';

class FeatureComponent extends StatelessWidget {
  var icon;
  var text;
  var onPressed;
  var startColor;
  var endColor;
  var inCircleColor;
  FeatureComponent(
      {Key? key,
      this.icon,
      this.text,
      this.onPressed,
      this.startColor,
      this.endColor,
      this.inCircleColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    startColor,
                    endColor
                    // Colors.black.withAlpha(0),
                  ],
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -22,
                    top: -22,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: inCircleColor,
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                  Positioned(
                    left: 123,
                    top: 95,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        width: MediaQuery.of(context).size.height * 0.60,
                        decoration: BoxDecoration(
                            // color: Color.fromRGBO(193, 230, 234, .5),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 3,
                              color: Colors.red.shade200,
                            ))),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Icon(
                            icon,
                            size: 50,
                          ),
                        ),
                        SizedBox(),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.07,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Text("$text",
                                style: GoogleFonts.prompt(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))
                      ]),
                ],
              )),
        ));
  }
}
