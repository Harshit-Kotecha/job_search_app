import 'package:get/get.dart';

class AppRoute {
  AppRoute._();

  static void toNamed(String route) {
    Get.toNamed<dynamic>(route);
  }

  static void offNamed(String route) {
    Get.offNamed<dynamic>(route);
  }

  static void offNamedUntil(String route) {
    Get.offNamedUntil<dynamic>(route, (route) => false);
  }
}
