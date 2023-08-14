import 'package:flutter/widgets.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/themes/color_styles.dart';

class ValidationError extends StatelessWidget {
  const ValidationError({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(value: 4, ctx: context),
        Text(
          errorText,
          style: const TextStyle(color: ColorStyles.failureColor),
        ),
      ],
    );
  }
}
