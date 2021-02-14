// Packages
import 'package:flutter/material.dart';

const defaultColor = Color(0xff1a202c);
const defaultFontSize = 14.0;

TextStyle contentDividerTitleTextStyle({color = defaultColor, double fontSize = defaultFontSize}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
  );
}

TextStyle bottomSheetTitleTextStyle({color = defaultColor, fontSize: 20.0, height: 1.4}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color ?? Colors.grey[90], height: height);
}
