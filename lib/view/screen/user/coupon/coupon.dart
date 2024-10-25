import 'package:auto_size_text/auto_size_text.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/coupon_controller/coupon_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/extension/space_extension.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponController());
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.coupons)),
      body: GetBuilder<CouponController>(builder: (controller) {
        return controller.obx(
          (state) => ListView(
            children: state!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CouponCard(
                        height: 250,
                        curvePosition: 170,
                        curveRadius: 30,
                        borderRadius: 10,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                              AppColor.primaryColor,
                              Colors.lightBlueAccent,
                            ])),
                        firstChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            10.height,
                            Text(
                              e.subCategoryName!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${e.rate} %',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: AutoSizeText(
                                  e.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        secondChild: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 42),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 80),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            onPressed: () => controller.appQrController
                                .showQRCode("${e.id!}|${e.subCategoryId}"),
                            child: const Text(
                              AppStrings.redeem,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
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
