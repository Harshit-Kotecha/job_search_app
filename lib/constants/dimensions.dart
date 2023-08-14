import 'package:flutter/material.dart';

const double baseHeight = 780;
const double baseWidth = 360;

double width(BuildContext context) => MediaQuery.of(context).size.width;
double height(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double scaleHeight(double val, BuildContext context) =>
    MediaQuery.of(context).size.height / baseHeight * val;
double scaleWidth(double val, BuildContext context) =>
    MediaQuery.of(context).size.width / baseWidth * val;
double scaleRadius(double val, BuildContext context) =>
    MediaQuery.of(context).size.height / baseHeight * val;
