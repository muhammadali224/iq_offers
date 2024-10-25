import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/bottom_nav_bar_model/bottom_nav_bar_model.dart';
import '../../../view/screen/user/account/account.dart';
import '../../../view/screen/user/awards/awards.dart';
import '../../../view/screen/user/best_of/best_of.dart';
import '../../../view/screen/user/coupon/coupon.dart';
import '../../../view/screen/user/home/home.dart';

class BottomNavBarController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  List<Widget> listTab = [
    const HomePage(),
    const Coupon(),
    Container(),
    const Awards(),
    const BestOf(),
    const Account(),
  ];
  List<BottomNavigationModel> bottomAppbar = [
    BottomNavigationModel(
        title: AppStrings.home,
        icon: CupertinoIcons.home,
        activeIcon: CupertinoIcons.house_fill),
    BottomNavigationModel(
        title: AppStrings.reels,
        icon: CupertinoIcons.video_camera,
        activeIcon: CupertinoIcons.videocam_fill),
    BottomNavigationModel(
        title: AppStrings.coupons,
        icon: CupertinoIcons.tickets,
        activeIcon: CupertinoIcons.tickets_fill),
    BottomNavigationModel(
        title: AppStrings.awards,
        icon: CupertinoIcons.gift,
        activeIcon: CupertinoIcons.gift_alt_fill),
    BottomNavigationModel(
        title: AppStrings.offers,
        icon: CupertinoIcons.flame,
        activeIcon: CupertinoIcons.flame_fill),
    BottomNavigationModel(
        title: AppStrings.account,
        icon: CupertinoIcons.person,
        activeIcon: CupertinoIcons.person_alt_circle),
  ];

  RxInt get currentIndex => _currentIndex;

  set currentIndex(RxInt index) {
    _currentIndex.value = index.value;
  }

  void updateIndex(int index) {
    if (index == 1) {
      Get.toNamed(AppRoutes.splashReel);
    } else {
      currentIndex.value = index;
    }
    update();
  }
}
