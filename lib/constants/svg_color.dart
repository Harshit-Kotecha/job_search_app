import 'package:flutter/widgets.dart';

ColorFilter svgColor(Color color) {
  return ColorFilter.mode(
    color,
    BlendMode.srcIn,
  );
}
