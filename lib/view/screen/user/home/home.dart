import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/home_controller/home_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../generated/assets.dart';
import '../../../widget/home/categories_slider.dart';
import '../../../widget/home/home_slider.dart';
import '../../../widget/home/section_title.dart';
import '../../../widget/home/story/story_section.dart';
import '../../../widget/home/timer_prize.dart';
import '../planet/cloud_planet.dart';
import '../planet/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(Assets.imagesBlackBackground),
                fit: BoxFit.fill,
              )),
              child: controller.obx(
                (state) => ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    10.height,
                    if (controller.storyList.isNotEmpty)
                      StorySection(storyList: controller.storyList),
                    GetBuilder<HomeController>(builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 25),
                        child: SizedBox(
                            height: Get.height / 2.5,
                            width: double.infinity,
                            child: CloudPlanet(
                              items: List.generate(
                                controller.suggestList.length,
                                (index) => PlanetItem(
                                  builder: () => Hero(
                                    tag: controller.suggestList[index].id!,
                                    child: GestureDetector(
                                      onTap: () => controller.goToPost(
                                          controller.suggestList[index]),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.primaryColor,
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                AppLink.subCategoriesImages +
                                                    controller
                                                        .suggestList[index]
                                                        .image!,
                                            width: 35,
                                            height: 35,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  index: index,
                                ),
                              ),
                            )),
                      );
                    }),
                    5.height,
                    const TimerPrize(),
                    const HomeAdvSlider(),
                    const SectionTitle(title: AppStrings.categories),
                    CategoriesSlider(state: state!)
                  ],
                ),
                onLoading: const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}
