import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/reels_controller/reels_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../generated/assets.dart';

class SplashReels extends StatelessWidget {
  const SplashReels({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReelsController());
    return GetBuilder<ReelsController>(builder: (controller) {
      return EasySplashScreen(
          backgroundImage: const AssetImage(Assets.imagesBlackBackground),
          logoWidth: 200,
          loaderColor: AppColor.primaryColor,
          futureNavigator: controller.futureCallback(),
          logo: Image.asset(
            Assets.imagesIqReel,
            filterQuality: FilterQuality.high,
          ));
    });
  }
}
