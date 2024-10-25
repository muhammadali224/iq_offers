import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'story_profile.dart';
import 'story_view_counter.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../../controller/user_role_controller/home_controller/story_controller.dart';
import '../../../../core/constant/api_link.dart';

class AppStoryView extends StatelessWidget {
  const AppStoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppStoryController());
    return GetBuilder<AppStoryController>(builder: (controller) {
      return Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              StoryView(
                storyItems: controller.storyItems,
                controller: controller.storyController,
                onComplete: () {
                  controller.refreshStory();
                },
                onVerticalSwipeComplete: (v) {
                  if (v == Direction.down) {
                    controller.refreshStory();
                  }
                },
                onStoryShow: (storyItem) {
                  controller.pos = controller.storyItems.indexOf(storyItem);
                  if (controller.pos > 0) {
                    controller.incrementView(
                        controller.storyModel.url![controller.pos].id!);
                    controller.update();
                  }
                },
              ),
              StoryProfile(
                name: controller.storyModel.subCategoryName!,
                imageUrl: AppLink.subCategoriesImages +
                    controller.storyModel.subCategoryImage!,
                createdDate:
                    controller.storyModel.url![controller.pos].createdAt!,
              ),
              StoryViewCounter(
                counter: controller.storyModel.url![controller.pos].viewCount,
              )
            ],
          ),
        ),
      );
    });
  }
}
