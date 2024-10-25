import 'package:auto_size_text/auto_size_text.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/partner_role_controller/partner_replacement_awards_controller/partner_replacement_awards_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/text_style.dart';

class PartnerReplacementAwards extends StatelessWidget {
  const PartnerReplacementAwards({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PartnerReplacementAwardController());
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.replacementAwards)),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<PartnerReplacementAwardController>(
              builder: (controller) {
            return controller.obx((state) => ListView(
                  shrinkWrap: true,
                  children: state!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevarmPrimaryCard(
                              child: ListTile(
                                title: AutoSizeText(
                                  e.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Text(
                                  e.countReplacement.toString(),
                                  style: AppTextStyle.largePrimaryText,
                                ),
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
