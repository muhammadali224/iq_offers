import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/routes.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/sub_cat_model/sub_cat_model.dart';
import '../../user_role_controller/user_controller.dart';

class PartnerHomeController extends GetxController
    with StateMixin<List<SubCatModel>> {
  AuthService authService = Get.find<AuthService>();
  final ApiProvider _apiProvider = ApiProvider();
  UserController userController = Get.find<UserController>();

  Future<void> getSubCategories() async {
    try {
      await _apiProvider
          .getData(
              "${AppLink.getPartnerSubCategories}${userController.user.id}")
          .then((response) async {
        if (response.body["status"] == "Token is Expired") {
          await authService.logout();
        } else {
          List<SubCatModel> subCategoriesList = [];
          List responseList = response.body['subCategories'];

          subCategoriesList
              .addAll(responseList.map((e) => SubCatModel.fromJson(e)));

          change(subCategoriesList, status: RxStatus.success());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void goToDetails(SubCatModel model) {
    Get.toNamed(AppRoutes.partnerDetails, arguments: model);
  }

  @override
  void onInit() async {
    getSubCategories();
    print(authService.getStoredToken);
    super.onInit();
  }
}
