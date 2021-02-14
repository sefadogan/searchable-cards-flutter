// Packages
import 'package:flutter/material.dart';

class SearchNoResult extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  SearchNoResult({
    this.text,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 20.0),
      child: Text(
        text ?? "No results found.",
        style: textStyle,
      ),
    );
  }
}
