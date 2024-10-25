import 'package:animated_number/animated_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_role_controller/point_controller/user_point_controller.dart';
import '../../../core/constant/app_strings.dart';
import '../../../generated/assets.dart';

class PointHeaderCard extends GetView<UserPointController> {
  const PointHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: Get.height / 4,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(double.parse(10.toString())),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesIqPoints),
                fit: BoxFit.fill,
              )),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedNumber(
                          duration: const Duration(seconds: 1),
                          startValue: 0,
                          endValue: controller.totalPoint,
                          isFloatingPoint: false,
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "  ${AppStrings.point}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
