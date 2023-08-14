import 'package:flutter/material.dart';
import '../../themes/color_styles.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          ColorStyles.defaultMainColor,
        ),
      ),
    );
  }
}
