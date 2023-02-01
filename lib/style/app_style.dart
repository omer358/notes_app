import 'package:flutter/material.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2fe);
  static Color mainColor = const Color.fromARGB(255, 81, 84, 110);
  static Color accentColor = const Color(0xFF0065FF);

  // setting the cards colors

  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  // setting text style
  static TextStyle mainTitle =
  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
  const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500);
}
