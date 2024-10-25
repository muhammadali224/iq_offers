import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/user_role_controller/post_controller/post_controller.dart';
import '../../../core/constant/color.dart';

class ExpandFloating extends GetView<PostController> {
  const ExpandFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (controller) {
        return ExpandableFab(
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.call),
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.close),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          type: ExpandableFabType.up,
          overlayStyle: ExpandableFabOverlayStyle(blur: 3.1),
          children: [
            if (controller.contactModel!.facebookUrl != null)
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Brand(Brands.facebook, size: 55),
                onPressed: () async =>
                    controller.lunchUrl(controller.contactModel!.facebookUrl!),
              ),
            if (controller.contactModel!.instagramUrl != null)
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Brand(Brands.instagram, size: 55),
                onPressed: () async =>
                    controller.lunchUrl(controller.contactModel!.instagramUrl!),
              ),
            if (controller.contactModel!.youtupeUrl != null)
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Brand(Brands.youtube, size: 55),
                onPressed: () async =>
                    controller.lunchUrl(controller.contactModel!.youtupeUrl!),
              ),
            if (controller.contactModel!.tiktokUrl != null)
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Brand(Brands.tiktok, size: 55),
                onPressed: () async =>
                    controller.lunchUrl(controller.contactModel!.tiktokUrl!),
              ),
            if (controller.contactModel!.sanpchatUrl != null)
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Brand(Brands.snapchat_circled_logo, size: 55),
                onPressed: () async =>
                    controller.lunchUrl(controller.contactModel!.sanpchatUrl!),
              ),
          ],
        );
      },
    );
  }
}
