// Packages
import 'package:flutter/material.dart';

class ScfText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;

  ScfText(
    this.text, {
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
