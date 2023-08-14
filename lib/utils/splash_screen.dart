import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/constants/named_routes.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/themes/color_styles.dart';

import '../constants/route_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        AppRoute.offNamed(NamedRoutes.logIn);
      } else {
        AppRoute.offNamed(NamedRoutes.mainScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          width: width(context),
          height: height(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorStyles.splashGradient1,
                ColorStyles.splashGradient2
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(
                80,
                context,
              ),
              vertical: scaleHeight(
                88,
                context,
              ),
            ),
            child: SvgPicture.asset(
              Assets.splashSvg,
              colorFilter: const ColorFilter.mode(
                ColorStyles.pureWhite,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
