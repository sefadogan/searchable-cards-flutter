// Packages
import 'package:flutter/material.dart';

const defaultColor = Color(0xff1a202c);
const double defaultFontSize = 14.0;

TextStyle contentDividerTitleTextStyle({color = defaultColor, double fontSize = defaultFontSize}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
  );
}
