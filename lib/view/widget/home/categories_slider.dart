import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';

import '../../../controller/user_role_controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/text_style.dart';
import '../../../data/model/category_model/category_model.dart';

class CategoriesSlider extends GetView<HomeController> {
  final List<CategoryModel> state;

  const CategoriesSlider({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: state
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => controller.gotoSubCategory(e.id!, e.name!),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: AppLink.categoriesImages + e.image!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          placeholder: (_, url) => Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            child: const BlurHash(
                              hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                            ),
                          ),
                        ),
                        AutoSizeText(
                          e.name!,
                          style: AppTextStyle.titleBlackText
                              .copyWith(color: Colors.white),
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
