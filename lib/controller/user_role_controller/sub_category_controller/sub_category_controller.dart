import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/cities_model/cities_model.dart';
import '../../../data/model/sub_cat_model/sub_cat_model.dart';

class SubCategoryController extends GetxController
    with StateMixin<List<SubCatModel>> {
  late int id;
  late String title;
  String cityName = AppStrings.all;
  List<CitiesModel> citiesList = [];
  final ApiProvider _apiProvider = ApiProvider();

  Future<void> getSubCategories() async {
    try {
      await _apiProvider.getData("${AppLink.subCategoriesIndex}$id/1/1").then(
          (response) {
        List<SubCatModel> subCategoriesList = [];
        List responseList = response.body['subCategories'];
        citiesList.clear();
        citiesList = [const CitiesModel(id: 0, name: AppStrings.all)];
        List cities = response.body['cities'];
        subCategoriesList
            .addAll(responseList.map((e) => SubCatModel.fromJson(e)));
        citiesList.addAll(cities.map((e) => CitiesModel.fromJson(e)));
        cityName = AppStrings.all;
        change(subCategoriesList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getFilterSubCategories(int cityId) async {
    try {
      await _apiProvider
          .getData("${AppLink.subCategoriesFilterSubCategory}$cityId/$id")
          .then((response) {
        List<SubCatModel> subCategoriesList = [];
        List responseList = response.body['result'];
        subCategoriesList
            .addAll(responseList.map((e) => SubCatModel.fromJson(e)));
        cityName = response.body['cityName'];
        change(subCategoriesList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  goToPost(SubCatModel model) {
    Get.toNamed(AppRoutes.post, arguments: model);
  }

  @override
  void onInit() async {
    id = Get.arguments['id'];
    title = Get.arguments['title'];
    await getSubCategories();
    super.onInit();
  }
}
