


import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';


class AppTextStyles {
  
  static  TextStyle titleTextStyle = TextStyle(
    color:Tcolo.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

static TextStyle subtitleTextStyle(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: Tcolo.black,
      fontSize: screenHeight * 0.018,
    );
  }

  static  TextStyle carousalHeadingTextStyle = TextStyle(
                                                      color: Tcolo.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700);
  static  TextStyle carousalHeading2TextStyle =TextStyle(
                      color: Tcolo.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700);

                      static TextStyle carousalStyle3 =  TextStyle(color: Tcolo.gray, fontSize: 13);

static TextStyle loginHeading1 = TextStyle(
                      color: Tcolo.gray,
                      fontSize: 16,
                    );
  static TextStyle loginEnding = TextStyle(
                            color: Tcolo.black,
                            fontSize: 14,
                          );

  static TextStyle welcomeSubtitle = TextStyle(
                  color: Tcolo.gray,
                  fontSize: 13
                 );                        
}