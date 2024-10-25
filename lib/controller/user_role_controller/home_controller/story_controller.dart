import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/story_model/story_model.dart';
import 'home_controller.dart';

class AppStoryController extends GetxController {
  late StoryModel storyModel;
  StoryController storyController = StoryController();
  List<StoryItem> storyItems = [];
  final ApiProvider _apiProvider = ApiProvider();
  int pos = 0;

  intiData() {
    for (var element in storyModel.url!) {
      if (element.type == "Content") {
        storyItems.add(
          StoryItem.text(
              title: element.content!,
              backgroundColor: AppColor.black,
              textStyle: const TextStyle(
                  decoration: TextDecoration.none, fontSize: 20),
              duration: const Duration(seconds: 10)),
        );
      }
      if (element.type == "Image") {
        storyItems.add(
          StoryItem.pageImage(
            url: AppLink.storyImages + element.image!,
            controller: storyController,
            caption: element.content,
            duration: const Duration(seconds: 20),
          ),
        );
      }
      if (element.type == "Video") {
        storyItems.add(
          StoryItem.pageVideo(
            AppLink.storyImages + element.video!,
            controller: storyController,
            duration: const Duration(seconds: 30),
            caption: element.content,
          ),
        );
      }
    }
    update();
  }

  Future<void> incrementView(int id) async {
    try {
      await _apiProvider.getData("${AppLink.incrementStory}$id");
    } catch (e) {
      throw Exception("Error Get Awards : $e");
    }
    update();
  }

  refreshStory() async {
    HomeController controller = Get.find<HomeController>();
    Get.back();
    await controller.getStories();
  }

  @override
  void onInit() {
    storyModel = Get.arguments;
    intiData();
    incrementView(storyModel.url![pos].id!);
    Jiffy.setLocale("ar");
    super.onInit();
  }
}
