


import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';


class AppTextStyles {
  
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
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

  static const TextStyle headingTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 13,
    
  );
  static const TextStyle subHeadingTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 13,
    
  );

  
}