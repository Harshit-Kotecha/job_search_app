import 'package:flutter/material.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/themes/color_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.boldWelcomeText,
    required this.lightWelcomeText,
  });

  final String lightWelcomeText;
  final String boldWelcomeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lightWelcomeText,
          style: const TextStyle(
            fontSize: 14,
            color: ColorStyles.c95969d,
            fontWeight: FontWeight.w500,
          ),
        ),
        VerticalSpace(value: 5, ctx: context),
        Text(
          boldWelcomeText,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorStyles.c0d0d26,
          ),
        ),
      ],
    );
  }
}
