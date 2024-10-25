import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/user_role_controller/post_controller/post_controller.dart';
import '../../../generated/assets.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: controller.goToSplashReels,
              child: Image.asset(
                Assets.imagesIqReel,
                height: 65,
                width: 65,
              ),
            ),
          ),
          if (controller.contactModel?.phone != null)
            Expanded(
                child: IconButton(
              onPressed: () async => controller.launchCall(),
              icon: Brand(Brands.phone, size: 55),
            )),
          if (controller.contactModel?.location != null)
            Expanded(
                child: IconButton(
              onPressed: () async =>
                  controller.lunchUrl(controller.contactModel!.location!),
              icon: Brand(Brands.google_maps, size: 55),
            )),
          if (controller.contactModel?.whatsappUrl != null)
            Expanded(
                child: IconButton(
              onPressed: () async =>
                  controller.lunchUrl(controller.contactModel!.whatsappUrl!),
              icon: Brand(Brands.whatsapp, size: 55),
            )),
          const Divider(
            endIndent: 20,
            indent: 20,
          ),
        ],
      );
    });
  }
}
