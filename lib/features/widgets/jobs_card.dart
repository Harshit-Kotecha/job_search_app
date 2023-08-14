import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_search_app/atom/pill.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/controllers/data_controller.dart';
import 'package:job_search_app/features/widgets/horizontal_space.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/modals/data/data_model.dart';
import 'package:job_search_app/themes/color_styles.dart';
import '../../controllers/controller.dart';

class JobsCard extends StatelessWidget {
  const JobsCard({
    super.key,
    required this.color,
    required this.dataModel,
  });

  final Color color;
  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    const List<String> pillRandom = ["Security", "Safety"];
    final List<dynamic> extensionsList = dataModel.extensions as List<dynamic>;

    final DataController controller = Get.find();
    final Controller tabSwitchController = Get.find();
    return Container(
      padding: EdgeInsets.fromLTRB(
        scaleWidth(22, context),
        scaleHeight(24, context),
        scaleWidth(22, context),
        scaleHeight(20, context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          scaleRadius(24, context),
        ),
        color: color,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COMPANY thumbnail
              Container(
                decoration: BoxDecoration(
                  color: ColorStyles.pureWhite,
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(4, context),
                  vertical: scaleHeight(4, context),
                ),
                child: CachedNetworkImage(
                  imageUrl: dataModel.thumbnail.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 28,
                  height: 28,
                ),
              ),
              HorizontalSpace(value: 4, ctx: context),
              // TITLE AND DESCRIPTION
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataModel.title.toString().length < 20
                        ? dataModel.title.toString()
                        : '${dataModel.title.toString().substring(0, 20)}...',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorStyles.pureWhite,
                    ),
                  ),
                  VerticalSpace(value: 3, ctx: context),
                  Text(
                    dataModel.companyName.toString().length < 22
                        ? dataModel.companyName.toString()
                        : '${dataModel.companyName.toString().substring(0, 22)}...',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.pureWhite,
                    ),
                  ),
                ],
              ),
              HorizontalSpace(value: 4, ctx: context),
              GestureDetector(
                onTap: () {
                  controller.updateSavedJobs(dataModel);
                  tabSwitchController.currentIndex =
                      tabSwitchController.currentIndex == 3 ? 2 : 3;
                  tabSwitchController.switchScreen();
                },
                child: controller.savedJobs.value
                        .any((element) => element.id == dataModel.id)
                    ? const Icon(
                        Icons.check_circle,
                        color: ColorStyles.pureWhite,
                      )
                    : SvgPicture.asset(
                        Assets.bookmarkSvg,
                      ),
              ),
              // },
              // ),
            ],
          ),
          VerticalSpace(
            value: 40,
            ctx: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 3; i++) ...{
                if (i >= extensionsList.length ||
                    extensionsList[i].toString().length > 12) ...{
                  Pill(pillRandom[Random().nextInt(2)]),
                  HorizontalSpace(value: 4, ctx: context),
                } else ...{
                  Pill(extensionsList[i] as String),
                  HorizontalSpace(value: 4, ctx: context),
                }
              }
            ],
          ),
          VerticalSpace(
            value: 40,
            ctx: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataModel.via.toString().length < 20
                    ? dataModel.via.toString()
                    : '${dataModel.via.toString().substring(0, 20)}...',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.pureWhite,
                ),
              ),
              Text(
                dataModel.location.toString().length < 20
                    ? dataModel.location.toString()
                    : '${dataModel.location.toString().substring(0, 20)}...',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.pureWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
