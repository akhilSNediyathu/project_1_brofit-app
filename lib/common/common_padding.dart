import 'package:flutter/material.dart';

class ResponsivePadding {
  static EdgeInsetsGeometry getPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      
      return const EdgeInsets.symmetric(horizontal: 500,vertical: 500);
    } else {
      
      return const EdgeInsets.symmetric(horizontal: 20);
    }
  }
}