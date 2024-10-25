import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/user_role_controller/awards_controller/awards_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../core/function/show_snackbar.dart';
import '../../../widget/best_of/post_header_logo.dart';

class Awards extends StatelessWidget {
  const Awards({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AwardsController());
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.awards)),
      body: GetBuilder<AwardsController>(builder: (controller) {
        return controller.obx(
          (state) => ListView(
            children: state!
                .map((e) => GestureDetector(
                      onTap: () {
                        controller.totalPoints >= int.parse(e.value!)
                            ? controller.appQrController
                                .showQRCode("${e.id}|${e.subCategoryId}")
                            : showSnackBar(AppStrings.notEnoughPoints,
                                color: Colors.red);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: controller.isAwardsValid(e) ? 1 : .5,
                                color: controller.isAwardsValid(e)
                                    ? AppColor.green
                                    : AppColor.primaryColor)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PostHeaderLogo(
                                    name: e.subCategoryName!,
                                    imageUrl: AppLink.subCategoriesImages +
                                        e.subCategoryImage!),
                                if (e.startDate!.isAfter(DateTime.now()))
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${AppStrings.startIn} ${Jiffy.parseFromDateTime(e.startDate!).fromNow()}"),
                                  ),
                                if (controller.isAwardsValid(e))
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${AppStrings.remaining} ${controller.getTimeRemaining(e)}",
                                      style: AppTextStyle.smallBlackText
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                if (e.expiredDate!.isBefore(DateTime.now()) &&
                                    e.startDate!.isBefore(DateTime.now()))
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${AppStrings.expireIn} ${Jiffy.parseFromDateTime(e.expiredDate!).fromNow()}"),
                                  ),
                              ],
                            ),
                            if (controller.isAwardsValid(e))
                              TextButton(
                                onPressed: () => controller.appQrController
                                    .showQRCode("${e.id}|${e.subCategoryId}"),
                                child: const Text(AppStrings.pressToRedeem),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: AutoSizeText(e.description!),
                            ),
                            if (e.image != null)
                              CachedNetworkImage(
                                imageUrl: "${AppLink.awardsImages}${e.image}",
                                imageBuilder: (_, imageProvider) => Container(
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      }),
    );
  }
}
