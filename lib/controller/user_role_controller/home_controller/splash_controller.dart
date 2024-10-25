import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../view/screen/user/main_screen/main_screen.dart';
import 'home_controller.dart';

class SplashController extends GetxController {
  Future<Widget> futureCallback() async {
    HomeController controller = Get.find<HomeController>();
    await controller.getCategories();
    return Future.value(const MainScreen());
  }
}
