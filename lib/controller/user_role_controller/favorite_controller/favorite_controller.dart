import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/video_model/video_model.dart';
import '../../user_role_controller/user_controller.dart';

class FavoriteController extends GetxController
    with StateMixin<List<VideoModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  Future<void> addFavorite(int id) async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider
            .getData("${AppLink.addToFavorite}${userController.user.id}/$id");

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          showSnackBar(AppStrings.addedToFavorite,
              widget: Icon(
                Icons.favorite,
                color: AppColor.red,
              ));
        }
      }
    } catch (e) {
      throw Exception("Favorite : $e");
    }
  }

  Future<void> getFavorite() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        await _apiProvider
            .getData("${AppLink.getFavorite}${userController.user.id}")
            .then((response) {
          List<VideoModel> videoList = [];
          List responseList = response.body['result'];
          videoList.addAll(responseList.map((e) => VideoModel.fromJson(e)));
          change(videoList, status: RxStatus.success());
          print(videoList.toString());
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      }
    } catch (e) {
      throw Exception("Favorite : $e");
    }
  }

  @override
  void onInit() async {
    await getFavorite();
    super.onInit();
  }
}
