import 'package:flutter/material.dart';
import 'package:job_search_app/constants/dimensions.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, required this.value, required this.ctx});

  final double value;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(value, ctx),
    );
  }
}
