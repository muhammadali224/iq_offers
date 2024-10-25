import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/reels_controller/reels_controller.dart';

import 'reels_view.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReelsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: controller.obx((state) {
              return Swiper(
                loop: false,
                itemBuilder: (_, index) =>
                    ReelsViewVideo(videoModel: state[index]),
                itemCount: state!.length,
                scrollDirection: Axis.vertical,
              );
            }),
          ),
        );
      },
    );
  }
}
