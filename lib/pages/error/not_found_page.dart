// Packages
import 'package:flutter/material.dart';
// Widgets
import '../../widgets/shared/ScfText/ScfText.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ScfText("Not Found!"),
    );
  }
}
