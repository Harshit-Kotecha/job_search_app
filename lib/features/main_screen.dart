import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/assets_location.dart';
import '../controllers/controller.dart';
import '../themes/color_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(
      init: Controller(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: controller.switchScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: controller.currentIndex == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.navbarHome,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.navbarSelectedDot,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      )
                    : SvgPicture.asset(
                        Assets.navbarHome,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: controller.currentIndex == 1
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            Assets.navbarMsg,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.navbarSelectedDot,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      )
                    : SvgPicture.asset(
                        Assets.navbarMsg,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: controller.currentIndex == 2
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            Assets.navbarBookbar,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.navbarSelectedDot,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      )
                    : SvgPicture.asset(
                        Assets.navbarBookbar,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: controller.currentIndex == 3
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            Assets.navbarCategory,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.navbarSelectedDot,
                            colorFilter: const ColorFilter.mode(
                              ColorStyles.defaultMainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      )
                    : SvgPicture.asset(
                        Assets.navbarCategory,
                      ),
                label: '',
              ),
            ],
            currentIndex: controller.currentIndex,
            selectedItemColor: ColorStyles.defaultMainColor,
            backgroundColor: ColorStyles.pureWhite,
            onTap: (index) {
              controller.currentIndex = index;
            },
          ),
        ),
      ),
    );
  }
}
