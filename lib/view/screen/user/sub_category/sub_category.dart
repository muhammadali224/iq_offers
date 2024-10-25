import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../controller/user_role_controller/sub_category_controller/sub_category_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../widget/shred_component/no_data_center.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    SubCategoryController controller = Get.put(SubCategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title, style: AppTextStyle.largePrimaryText),
        actions: [
          PopupMenuButton(
              surfaceTintColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              itemBuilder: (_) => controller.citiesList
                  .map((e) => PopupMenuItem(
                        value: e.id,
                        child: Text(e.name!),
                      ))
                  .toList(),
              onSelected: (value) async {
                value == 0
                    ? await controller.getSubCategories()
                    : await controller.getFilterSubCategories(value);
              },
              tooltip: AppStrings.showCities,
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Brand(Brands.maps),
                    10.width,
                    GetBuilder<SubCategoryController>(builder: (controller) {
                      return Text(
                        controller.cityName,
                        style: AppTextStyle.titleBlackText,
                      );
                    })
                  ],
                ),
              ))
        ],
      ),
      body: controller.obx(
        (state) {
          if (state!.isNotEmpty) {
            return ListView(
              shrinkWrap: true,
              children: state
                  .map((e) => Hero(
                        tag: e.id!,
                        child: GestureDetector(
                          onTap: () => controller.goToPost(e),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: AppLink.subCategoriesImages +
                                          e.image!,
                                      placeholder: (_, url) => const Center(
                                          child: CircularProgressIndicator()),
                                      imageBuilder: (_, imageProvider) =>
                                          Container(
                                        width: double.infinity,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            )),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10))),
                                            child: AutoSizeText(
                                              e.name!,
                                              style: AppTextStyle.titleBlackText
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryColor
                                                .withOpacity(0.8),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        child: Text(
                                          e.cityName!,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ))),
                                Positioned(
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: AppColor.primaryColor
                                                  .withOpacity(0.8),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomLeft:
                                                          Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Text(
                                                e.totalRating!
                                                    .toStringAsFixed(1),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              )
                                            ],
                                          )),
                                    )),
                              ],
                            ),
                          ),
                        ),
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
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
