import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/controllers/controller.dart';
import 'package:job_search_app/features/widgets/horizontal_space.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/modals/data/data_model.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../atom/pill.dart';

class FullPageJob extends StatelessWidget {
  const FullPageJob({super.key});

  Future<void> launchUrlButton(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DataModel dataModel = Get.arguments as DataModel;
    const List<String> pillRandom = ["Security", "Safety"];
    final List<dynamic> extensionsList = dataModel.extensions as List<dynamic>;
    final List<dynamic> responsibilityist =
        dataModel.responsibilities as List<dynamic>;
    final List<dynamic> benefitList = dataModel.benefits as List<dynamic>;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight(context) * 0.5,
            child: Stack(
              children: [
                SvgPicture.asset(
                  Assets.detailsContainer,
                  width: screenWidth(context),
                  height: screenHeight(context) * 0.466,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorStyles.pureWhite,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: dataModel.thumbnail.toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      VerticalSpace(
                        value: scaleHeight(24, context),
                        ctx: context,
                      ),
                      Text(
                        dataModel.title.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: ColorStyles.pureWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VerticalSpace(
                        value: scaleHeight(8, context),
                        ctx: context,
                      ),
                      Text(
                        dataModel.companyName.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorStyles.pureWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      VerticalSpace(
                        value: scaleHeight(32, context),
                        ctx: context,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          },
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          GetX<Controller>(
            init: Controller(),
            builder: (tab) => Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: scaleHeight(8, context),
                  horizontal: scaleWidth(24, context),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            tab.switchTab = 0;
                          },
                          child: Text(
                            'Description',
                            style: TextStyle(
                              color: tab.tabController == 0
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            tab.switchTab = 1;
                          },
                          child: Text(
                            'Responsibilities',
                            style: TextStyle(
                              color: tab.tabController == 1
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            tab.switchTab = 2;
                          },
                          child: Text(
                            'Benefits',
                            style: TextStyle(
                              color: tab.tabController == 2
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaleHeight(290, context),
                      child: ListView(
                        children: [
                          if (tab.tabController == 0) ...{
                            Text(dataModel.description.toString()),
                          } else if (tab.tabController == 1) ...{
                            for (int i = 0;
                                i < responsibilityist.length;
                                i++) ...{
                              Text('\u2022 ${responsibilityist[i]}'),
                              VerticalSpace(
                                value: scaleHeight(8, context),
                                ctx: context,
                              ),
                            }
                          } else ...{
                            for (int i = 0; i < benefitList.length; i++) ...{
                              Text('\u2022 ${benefitList[i]}'),
                              VerticalSpace(
                                value: scaleHeight(8, context),
                                ctx: context,
                              ),
                            }
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrlButton(dataModel.url.toString());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(24, context),
              ),
              child: Container(
                width: screenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(10, context),
                  ),
                  color: ColorStyles.defaultMainColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: scaleHeight(16, context),
                  ),
                  child: Center(
                    child: Text(
                      'Apply now',
                      style: TextStyle(
                        fontSize: scaleWidth(18, context),
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.pureWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
