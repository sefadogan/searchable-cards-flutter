// Packages
import 'package:flutter/material.dart';

class BottomSheetDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 60,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
