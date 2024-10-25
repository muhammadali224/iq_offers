import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../generated/assets.dart';

import '../../../../controller/user_role_controller/home_controller/splash_controller.dart';
import '../../../../core/constant/app_strings.dart';

class SplashScreenViewer extends StatelessWidget {
  const SplashScreenViewer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return GetBuilder<SplashController>(builder: (controller) {
      return EasySplashScreen(
          backgroundImage: const AssetImage(Assets.imagesBlackBackground),
          logoWidth: 200,
          loaderColor: AppColor.primaryColor,
          loadingText: const Text(
            AppStrings.loadingBestOffers,
            style: TextStyle(fontSize: 16, fontFamily: "Alexandria"),
          ),
          futureNavigator: controller.futureCallback(),
          // navigator: const HomePage(),
          logo: Image.asset(
            Assets.imagesLogoEmptyWhite,
            filterQuality: FilterQuality.high,
          ));
    });
  }
}
