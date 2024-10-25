import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/partner_role_controller/partner_coupon_controller/partner_coupon_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../core/extension/space_extension.dart';

class PartnerCoupon extends StatelessWidget {
  const PartnerCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PartnerCouponController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.coupons),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<PartnerCouponController>(builder: (controller) {
            return controller.obx((state) => ListView(
                  shrinkWrap: true,
                  children: state!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevarmPrimaryCard(
                              child: Column(
                                children: [
                                  Text(
                                    e.description!,
                                    textAlign: TextAlign.center,
                                  ),
                                  10.height,
                                  ElevarmStackedHorizontalBarChart(
                                    dataSource: [
                                      ElevarmStackedHorizontalBarChartData(
                                        label: AppStrings.couponCount,
                                        value: int.parse(e.countCoupon!),
                                        color: ElevarmColors.success,
                                      ),
                                      ElevarmStackedHorizontalBarChartData(
                                        label:
                                            AppStrings.couponReplacementCount,
                                        value: -int.parse(e.replacement!),
                                        color: ElevarmColors.primary,
                                      ),
                                      ElevarmStackedHorizontalBarChartData(
                                        label: AppStrings.couponDiscountValue,
                                        value: int.parse(e.rate!),
                                        color: ElevarmColors.danger,
                                      ),
                                    ],
                                  ),
                                  30.height,
                                  if (e.status == "0")
                                    Text(
                                      "الكوبون منتهي ",
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
