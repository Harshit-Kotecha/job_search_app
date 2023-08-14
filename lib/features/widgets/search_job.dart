import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/features/widgets/horizontal_space.dart';
import 'package:job_search_app/themes/color_styles.dart';

class SearchJob extends StatelessWidget {
  const SearchJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextField(
              cursorColor: ColorStyles.darkTitleColor,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(24, context),
                    vertical: scaleHeight(14, context),
                  ),
                  child: SvgPicture.asset(
                    Assets.search,
                  ),
                ),
                hintText: StaticText.searchJobPosition,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(
                    color: ColorStyles.darkTitleColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(color: ColorStyles.f2f2f3),
                ),
                filled: true,
                fillColor: ColorStyles.f2f2f3,
              ),
            ),
          ),
        ),
        HorizontalSpace(value: 16, ctx: context),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.filter,
          ),
        ),
      ],
    );
  }
}
