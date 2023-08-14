import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/constants/named_routes.dart';
import 'package:job_search_app/controllers/data_controller.dart';
import 'package:job_search_app/features/widgets/custom_progress_indicator.dart';
import 'package:job_search_app/features/widgets/jobs_card.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:job_search_app/themes/font_styles.dart';

class SavedJobsScreen extends StatelessWidget {
  SavedJobsScreen({super.key});

  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Jobs',
          style: TextStyle(
            color: ColorStyles.darkTitleColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorStyles.pureWhite,
      ),
      body: Center(
        child: FutureBuilder(
          future: controller.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // final jobs = controller.savedJobs.value;
              // final savedList = controller.savedJobsList();
              if (controller.savedJobs.value.isEmpty) {
                return const Center(
                  child: Text('No saved jobs!'),
                );
              }
              if (controller.savedJobs.value.isNotEmpty) {
                return Expanded(
                  // height: 600,
                  child: ListView.builder(
                    itemCount: controller.savedJobs.value.length,
                    itemBuilder: (context, index) {
                      // if (controller.savedJobs.value
                      //     .contains(jobs[index].id)) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            NamedRoutes.fullPageJob,
                            arguments: controller.savedJobs.value[index],
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: scaleHeight(10, context),
                            horizontal: scaleWidth(12, context),
                          ),
                          child: JobsCard(
                            // companyName: jobs[index].companyName,
                            // location: jobs[index].location,
                            // thumbnail: jobs[index].thumbnail.toString(),
                            // title: jobs[index].title,
                            dataModel: controller.savedJobs.value[index],
                            color: index % 2 == 0
                                ? ColorStyles.c5386E4
                                : const Color(0xFF3A5C99),
                            // via: jobs[index].via,
                            // extensions: jobs[index].extensions as List,
                            // id: jobs[index].id,
                          ),
                        ),
                      );
                      // }
                      // return Text('hi');
                    },
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error fetching the jobs!',
                  style: FontStyles.boldStyle,
                ),
              );
            }

            return const CustomProgressIndicator();
          },
        ),
      ),
    );
    // },
    //   ),
    // );
  }
}
