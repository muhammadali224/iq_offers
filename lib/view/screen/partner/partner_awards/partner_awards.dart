import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/partner_role_controller/partner_awards_controller/partner_awards_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/text_style.dart';

class PartnerAwards extends StatelessWidget {
  const PartnerAwards({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PartnerAwardController());
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.awards)),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<PartnerAwardController>(builder: (controller) {
            return controller.obx((state) => ListView(
                  shrinkWrap: true,
                  children: state!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevarmPrimaryCard(
                              child: Column(
                                children: [
                                  if (e.image != null)
                                    CachedNetworkImage(
                                        imageUrl:
                                            "${AppLink.awardsImages}${e.image}"),
                                  Text(
                                    e.description!,
                                    textAlign: TextAlign.center,
                                  ),
                                  if (e.status == "0")
                                    Text(
                                      "العرض منتهي ",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.largePrimaryText,
                                    ),
                                  const ElevarmDivider(
                                    color: ElevarmColors.danger,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(AppStrings.value),
                                      Text("${e.value!} ${AppStrings.point}"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(AppStrings.createDate),
                                      Text(Jiffy.parseFromDateTime(e.createdAt!)
                                          .format(
                                              pattern: "yyyy-MM-dd hh:mm a")),
                                    ],
                                  ),
                                  if (e.createdAt != e.updatedAt)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(AppStrings.updateDate),
                                        Text(Jiffy.parseFromDateTime(
                                                e.updatedAt!)
                                            .format(
                                                pattern: "yyyy-MM-dd hh:mm a")),
                                      ],
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(AppStrings.startDate),
                                      Text(Jiffy.parseFromDateTime(e.startDate!)
                                          .format(pattern: "yyyy-MM-dd")),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(AppStrings.expireDate),
                                      Text(Jiffy.parseFromDateTime(
                                              e.expiredDate!)
                                          .format(
                                              pattern: "yyyy-MM-dd hh:mm a")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ));
          }),
        ),
      ),
    );
  }
}
