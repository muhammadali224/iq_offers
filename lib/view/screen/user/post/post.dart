import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/post_controller/post_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../widget/post/expanded_floating.dart';
import '../../../widget/post/post_container.dart';
import '../../../widget/post/social_section.dart';
import '../../../widget/shred_component/custom_cached_images.dart';
import '../../../widget/shred_component/no_data_center.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PostController());

    return GetBuilder<PostController>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: controller.contactModel != null
            ? const ExpandFloating()
            : Container(),
        body: Hero(
          tag: controller.subCatModel.id!,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                elevation: 10,
                expandedHeight: 300,
                pinned: true,
                floating: true,
                bottom: controller.contactModel != null
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(20),
                        child: Transform.translate(
                          offset: const Offset(0, 5),
                          child: const SocialSection(),
                        ),
                      )
                    : null,
                title: Text(controller.subCatModel.name!),
                flexibleSpace: FlexibleSpaceBar(
                  background: CustomCachedNetwork(
                    imageUrl: AppLink.subCategoriesImages +
                        controller.subCatModel.image!,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      10.height,
                      if (controller.contactModel == null)
                        const Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 10,
                          child: SocialSection(),
                        ),
                      Obx(() {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: controller.addUserInterest,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      !controller.isInterest.value
                                          ? Icons.notification_add
                                          : Icons.notifications_off,
                                      color: Colors.orange,
                                    ),
                                    5.width,
                                    AutoSizeText(
                                      controller.isInterest.value
                                          ? AppStrings.notificationsUnInterest
                                          : AppStrings.notificationsInterest,
                                      maxFontSize: 25,
                                      minFontSize: 20,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }),
                      if (controller.authService.isTokenValid().value)
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            controller.evaluate(rating);
                          },
                        ),
                      20.height,
                      controller.obx(
                        (state) {
                          if (state!.isNotEmpty) {
                            return Column(
                              children: state
                                  .map((e) => PostContainer(
                                        e: e,
                                      ))
                                  .toList(),
                            );
                          } else {
                            return const NoDataCenter();
                          }
                        },
                        onEmpty: const Text("Empty"),
                        onError: (error) {
                          return Text(error.toString());
                        },
                        onLoading:
                            const Center(child: CircularProgressIndicator()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
