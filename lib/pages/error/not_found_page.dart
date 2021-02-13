// Packages
import 'package:flutter/material.dart';
// Widgets
import 'package:SearchableCards/widgets/shared/scf_text/scf_text.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ScfText("Not Found!"),
    );
  }
}
