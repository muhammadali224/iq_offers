import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../controller/partner_role_controller/partner_details_controller/partner_details_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/text_style.dart';
import '../../../widget/partner_details/partner_details_card.dart';

class PartnerDetails extends StatelessWidget {
  const PartnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    PartnerDetailsController controller = Get.put(PartnerDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.subModel.name!),
      ),
      body: GridView.builder(
          itemCount: 7,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return index <= 3
                ? Obx(() {
                    return PartnerDetailsCard(
                      onTap: () => controller.goToRoute(index),
                      child: PieChart(
                        dataMap: {
                          controller.names[index]:
                              controller.dataMap.values.elementAt(index)
                        },
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 10,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        totalValue: 100,

                        // initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        // ringStrokeWidth: 32,
                        centerText: controller.dataMap.keys.elementAt(index),
                        baseChartColor: Colors.grey.shade400,
                        legendOptions: const LegendOptions(
                          showLegendsInRow: true,
                          legendPosition: LegendPosition.bottom,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 0,
                        ),
                      ),
                    );
                  })
                : index == 4
                    ? PartnerDetailsCard(
                        onTap: () => controller.goToRoute(index),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_2_outlined,
                              size: 100,
                              color: AppColor.primaryColor,
                            ),
                            Text(
                              "إستبدال كوبون",
                              style: AppTextStyle.largeBlackText,
                            )
                          ],
                        ),
                      )
                    : index == 5
                        ? PartnerDetailsCard(
                            onTap: () => controller.goToRoute(index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.qr_code_2_outlined,
                                  size: 100,
                                  color: AppColor.primaryColor,
                                ),
                                Text(
                                  "إستبدال جائزة",
                                  style: AppTextStyle.largeBlackText,
                                )
                              ],
                            ),
                          )
                        : PartnerDetailsCard(
                            onTap: () => controller.goToRoute(index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.story_outline,
                                  size: 100,
                                  color: AppColor.primaryColor,
                                ),
                                Text(
                                  "إضافة حالة",
                                  style: AppTextStyle.largeBlackText,
                                )
                              ],
                            ),
                          );
          }),
    );
  }
}
