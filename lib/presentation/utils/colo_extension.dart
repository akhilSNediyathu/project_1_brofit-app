// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Tcolo {
  static Color get Primarycolor1 => const Color(0xff92A3FD);
  static Color get Primarycolor2 => const Color(0xff9DCEFF);

  static Color get Secondarycolor1 => const Color(0xffC58BF2);
  static Color get Secondarycolor2 => const Color(0xffEEA4CE);
   static Color get Tertiarycolor1 => const Color(0xff996C65);
  static Color get Tertiarycolor2 => const Color(0xff92A3FD);

  static List<Color> get primaryG => [Primarycolor2, Primarycolor1];
  static List<Color> get SecondaryG => [Secondarycolor1, Secondarycolor2];
  static List<Color> get tertiaryG => [Tertiarycolor1, Tertiarycolor2];
  static List<Color> get cardBg => [Colors.blue,Colors.green ];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get Lightgrey => const Color(0xffF7F8F8);
}
