import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../controller/user_role_controller/post_controller/post_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/extension/space_extension.dart';
import '../../../data/model/post_model/post_model.dart';

class PostContainer extends StatelessWidget {
  final PostModel e;

  const PostContainer({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(width: 0.2)),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: AppLink.postImages + e.image!,
              fit: BoxFit.fill,
              imageBuilder: (_, imageProvider) => Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(e.description!),
            ),
            15.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    controller.like(e.id!);
                  },
                  splashColor: AppColor.primaryColor,
                  child: Row(
                    children: [
                      const Icon(Iconsax.like_1_outline),
                      5.width,
                      Text(
                        e.likes ?? "0",
                        style: AppTextStyle.smallPrimaryText,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => controller.disLike(e.id!),
                  child: Row(
                    children: [
                      const Icon(Iconsax.dislike_outline),
                      5.width,
                      Text(
                        e.disLikes ?? "0",
                        style: AppTextStyle.smallPrimaryText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            15.height,
          ],
        ),
      );
    });
  }
}
