import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/constants/assets_location.dart';

class SvgBanner extends StatelessWidget {
  const SvgBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.splashSvg,
    );
  }
}
