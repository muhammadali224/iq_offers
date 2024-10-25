import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/advertisement_model/advertisement_model.dart';
import '../../../data/model/category_model/category_model.dart';
import '../../../data/model/story_model/story_model.dart';
import '../../../data/model/sub_cat_model/sub_cat_model.dart';

class HomeController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  List<AdvertisementModel> adsList = [];
  List<SubCatModel> suggestList = [];
  List<StoryModel> storyList = [];
  AuthService authService = Get.put(AuthService());
  int currentIndex = 0;

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  Future<void> getCategories() async {
    try {
      await _apiProvider.getData(AppLink.categoriesIndex).then(
          (response) async {
        List<CategoryModel> categoriesList = [];
        List responseList = response.body['data'];
        categoriesList
            .addAll(responseList.map((e) => CategoryModel.fromJson(e)));
        await getStories();
        await getSuggestSubCategories();
        await getAdvertisement();
        change(categoriesList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  Future<void> getAdvertisement() async {
    try {
      await _apiProvider.getData(AppLink.advertisementIndex).then((response) {
        adsList.clear();
        List responseList = response.body['data'];
        adsList.addAll(responseList.map((e) => AdvertisementModel.fromJson(e)));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  Future<void> getSuggestSubCategories() async {
    try {
      await _apiProvider.getData(AppLink.subCategoriesSuggest).then((response) {
        suggestList.clear();
        List responseList = response.body['subCategories'];
        suggestList.addAll(responseList.map((e) => SubCatModel.fromJson(e)));
      });

      update();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getStories() async {
    try {
      await _apiProvider.getData(AppLink.getStory).then((response) {
        storyList.clear();
        List responseList = response.body['data'];

        storyList.addAll(responseList.map((e) => StoryModel.fromJson(e)));
      });

      update();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  gotoSubCategory(int id, String title) {
    Get.toNamed(AppRoutes.subCategory, arguments: {
      'id': id,
      'title': title,
    });
  }

  goToPost(SubCatModel model) {
    Get.toNamed(AppRoutes.post, arguments: model);
  }

  changIndex(int index) {
    currentIndex = index;
    HapticFeedback.lightImpact();
    update();
  }
}
