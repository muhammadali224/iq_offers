import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_role_controller/home_controller/bottom_nav_bar_controller.dart';
import '../../../core/constant/color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarController());

    return GetBuilder<BottomNavBarController>(builder: (controller) {
      return BottomNavigationBar(
        elevation: 10,
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.blueGrey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (index) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          controller.updateIndex(index);
        },
        items: controller.bottomAppbar
            .map((e) => BottomNavigationBarItem(
                  label: e.title,
                  activeIcon: Icon(e.activeIcon),
                  icon: Icon(e.icon),
                  backgroundColor: Colors.black,
                ))
            .toList(),
      );
    });
  }
}
