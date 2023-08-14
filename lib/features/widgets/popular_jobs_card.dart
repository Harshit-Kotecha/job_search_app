import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/themes/color_styles.dart';

class PopularJobsCard extends StatelessWidget {
  const PopularJobsCard({
    super.key,
    required this.logo,
    required this.company,
    required this.role,
    required this.salary,
    required this.color,
  });

  final String logo;
  final String role;
  final String company;
  final String salary;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(136, context),
      height: scaleHeight(164, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(scaleRadius(24, context)),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(logo),
          Text(
            role,
            style: TextStyle(
              fontSize: scaleWidth(14, context),
              color: ColorStyles.c0d0d26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            company,
            style: TextStyle(
              fontSize: scaleWidth(12, context),
              color: ColorStyles.c7A7C85,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            salary,
            style: TextStyle(
              fontSize: scaleWidth(12, context),
              color: ColorStyles.c0d0d26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
