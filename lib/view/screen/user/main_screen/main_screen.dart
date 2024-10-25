import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/home_controller/bottom_nav_bar_controller.dart';
import '../../../widget/home/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarController());
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: const BottomNavBar(),
        body: GetBuilder<BottomNavBarController>(
          builder: (controller) =>
              controller.listTab[controller.currentIndex.value],
        ));
  }
}
