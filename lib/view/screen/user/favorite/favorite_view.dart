import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/favorite_controller/favorite_controller.dart';
import '../reels/reels_view.dart';

class FavoriteReelsView extends StatelessWidget {
  const FavoriteReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return GetBuilder<FavoriteController>(
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
