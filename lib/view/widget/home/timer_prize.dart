import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../../controller/user_role_controller/home_controller/timer_controller.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/extension/space_extension.dart';
import '../shred_component/custom_button.dart';

class TimerPrize extends StatelessWidget {
  const TimerPrize({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppTimerController());

    return GetBuilder<AppTimerController>(builder: (controller) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Visibility(
                visible: controller.canGetPrize.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomButton(
                    onPressed: () async {
                      controller.getPrize();
                    },
                    color: AppColor.primaryColor,
                    title: AppStrings.getPrize,
                    icon: FontAwesome.award_solid,
                    iconColor: Colors.amber,
                  ),
                ),
              );
            }),
            5.height,
            TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
              return Obx(() {
                return Visibility(
                  visible: !controller.canGetPrize.value &&
                      controller.eta.value.isNotEmpty,
                  child: Text(
                    '${AppStrings.prizeAfter} : ${controller.eta}',
                    style:
                        TextStyle(fontSize: 20, color: AppColor.primaryColor),
                  ),
                );
              });
            }),
          ],
        ),
      );
    });
  }
}
