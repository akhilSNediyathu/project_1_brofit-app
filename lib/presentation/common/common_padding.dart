import 'package:flutter/material.dart';

class ResponsivePadding {
  static EdgeInsetsGeometry getPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      
      return const EdgeInsets.symmetric(horizontal: 200,vertical: 200);
    } else {
      
      return const EdgeInsets.symmetric(horizontal: 20);
    }
  }
  static EdgeInsetsGeometry getPadding2(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      
      return const EdgeInsets.symmetric(horizontal: 100,);
    } else {
      
      return const EdgeInsets.symmetric(horizontal: 0);
    }
  }
}