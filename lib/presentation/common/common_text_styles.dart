


import 'package:brofit/presentation/common/colo_extension.dart';

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
                  fontSize: 18
                 );     
                   static  TextStyle profileStyle1 =TextStyle(
                      color: Tcolo.Primarycolor1,
                      fontSize: 20,
                      fontWeight: FontWeight.w700);  

                       static  TextStyle profileStyle2 =TextStyle(
                      color: Tcolo.Primarycolor1,
                      fontSize: 18,
                      );   
                       static TextStyle new1 = TextStyle(
                            color: Tcolo.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                          );
                          static TextStyle new2 = TextStyle(
                      color: Tcolo.black,
                      fontSize: 16,
                    );
                        static TextStyle workouAppBarTitle = TextStyle(fontWeight: FontWeight.w600, color: Tcolo.white);

                          static TextStyle exercises =  const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
                          
static TextStyle workoutListSub(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: screenHeight*0.015
    );
  }
                                      
}