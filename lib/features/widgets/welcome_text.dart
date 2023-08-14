import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/themes/font_styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.welcomePath,
    required this.welcomeText,
  });

  final String welcomeText;
  final String welcomePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              welcomeText,
              style: TextStyle(
                fontFamily: FontStyles.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: scaleWidth(25, context),
                color: ColorStyles.darkTitleColor,
              ),
            ),
            SvgPicture.asset(
              welcomePath,
              width: scaleWidth(32, context),
              height: scaleHeight(32, context),
              colorFilter: const ColorFilter.mode(
                ColorStyles.amber,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        const Text(
          StaticText.applyToJobs,
          style: FontStyles.lightStyle,
        ),
      ],
    );
  }
}
