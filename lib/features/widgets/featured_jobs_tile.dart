import 'package:flutter/material.dart';
import '../../themes/color_styles.dart';

class FeaturedJobsTile extends StatelessWidget {
  const FeaturedJobsTile({
    super.key,
    required this.mainText,
    required this.text,
  });

  final String mainText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorStyles.c0d0d26,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: ColorStyles.c95969d,
          ),
        ),
      ],
    );
  }
}
