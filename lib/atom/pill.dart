import 'package:flutter/material.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/themes/color_styles.dart';

class Pill extends StatelessWidget {
  const Pill(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.c26FFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(16, context),
        vertical: scaleHeight(5, context),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: scaleWidth(11, context),
          color: ColorStyles.pureWhite,
        ),
      ),
    );
  }
}
