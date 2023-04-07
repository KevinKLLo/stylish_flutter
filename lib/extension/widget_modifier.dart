import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget addPadding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}
