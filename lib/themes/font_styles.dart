import 'package:flutter/material.dart';
import 'package:job_search_app/themes/color_styles.dart';

class FontStyles {
  static const String fontFamily = 'NotoSans';

  static const TextStyle lightStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w100,
    color: Colors.grey,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle normalItalicStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle boldItalicStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle boldStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: ColorStyles.darkTitleColor,
  );
}
