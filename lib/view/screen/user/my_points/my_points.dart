import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/user_role_controller/point_controller/user_point_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/my_points/header_points.dart';

class MyPoints extends StatelessWidget {
  const MyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserPointController());
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.myPoints)),
      body: GetBuilder<UserPointController>(builder: (controller) {
        return controller.obx((state) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PointHeaderCard(),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: state!
                      .map((e) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: ListTile(
                              title: Text(
                                "${e.point}  [${Jiffy.parseFromDateTime(e.startDate!).format(pattern: "dd-MM-yyyy")}] ",
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: !e.expiredDate!.isAfter(DateTime.now())
                                  ? Text(
                                      int.parse(e.point!) >= 0
                                          ? AppStrings.expiredPoints
                                          : AppStrings.replacedPoints,
                                      style: TextStyle(
                                          color: AppColor.primaryColor),
                                    )
                                  : null,
                              subtitle: Text(e.description!),
                            ),
                          ))
                      .toList(),
                )),
              ],
            ));
      }),
    );
  }
}
