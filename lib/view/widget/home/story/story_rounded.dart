import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../data/model/story_model/story_model.dart';

class StoryRounded extends StatelessWidget {
  final StoryModel storyModel;

  const StoryRounded({super.key, required this.storyModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.storyView, arguments: storyModel);
      },
      child: Column(
        children: [
          5.height,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: CachedNetworkImage(
              imageUrl:
                  AppLink.subCategoriesImages + storyModel.subCategoryImage!,
              imageBuilder: (_, imageProvider) => Container(
                decoration: DottedDecoration(
                  shape: Shape.circle,
                  dash: [
                    240 ~/ storyModel.url!.length,
                    storyModel.url!.length == 1 ? 0 : 5
                  ],
                  strokeWidth: 3,
                  color: Colors.green,
                ),
                child: Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider)),
                ),
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(storyModel.subCategoryName!),
          ),
        ],
      ),
    );
  }
}
