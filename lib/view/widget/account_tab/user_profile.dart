import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/user_role_controller/account_controller/account_controller.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/extension/space_extension.dart';
import '../../../generated/assets.dart';

class UserProfile extends GetView<AccountController> {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (controller) {
      return SafeArea(
        child: Column(
          children: [
            20.height,
            Center(
                child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(width: 0.2, color: AppColor.primaryColor),
                  image: const DecorationImage(
                      image: AssetImage(Assets.imagesOffersLogo))),
            )),
            10.height,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "أهلا ,${controller.userController.user.userName}",
                style: AppTextStyle.largePrimaryText,
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionChip(
                      onPressed: controller.goToMyPoints,
                      labelStyle: const TextStyle(color: Colors.black),
                      label: const Text(AppStrings.myPoints),
                      avatar: const Icon(
                        FontAwesome.award_solid,
                        color: Colors.teal,
                      ),
                    ),
                    ActionChip(
                      onPressed: controller.goToMyFavorites,
                      labelStyle: const TextStyle(color: Colors.black),
                      label: const Text(AppStrings.favorite),
                      avatar: const Icon(
                        FontAwesome.heart_circle_bolt_solid,
                        color: Colors.red,
                      ),
                    ),
                    ActionChip(
                      onPressed: () async {
                        await controller.authService.logout();
                        controller.update();
                      },
                      labelStyle: const TextStyle(color: Colors.black),
                      label: const Text(AppStrings.logoutExit),
                      avatar: const Icon(
                        CupertinoIcons.person_badge_minus_fill,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      );
    });
  }
}
