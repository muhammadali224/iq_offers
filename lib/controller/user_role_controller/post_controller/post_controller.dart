import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/get_box_key.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/app.service.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/contact_model/contact_model.dart';
import '../../../data/model/post_model/post_model.dart';
import '../../../data/model/sub_cat_model/sub_cat_model.dart';
import '../../user_role_controller/user_controller.dart';

class PostController extends GetxController with StateMixin<List<PostModel>> {
  late SubCatModel subCatModel;
  ContactModel? contactModel;
  final ApiProvider _apiProvider = ApiProvider();
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();
  RxBool _isInterest = false.obs;
  List<int> keys = [];

  Future<void> getPosts() async {
    try {
      await _apiProvider.getData("${AppLink.postIndex}${subCatModel.id}").then(
          (response) {
        List<PostModel> postList = [];
        List responseList = response.body['data'];

        postList.addAll(responseList.map((e) => PostModel.fromJson(e)));

        change(postList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> getSocial() async {
    try {
      var response = await _apiProvider
          .getData("${AppLink.contactIndex}${subCatModel.id}");
      if (response.body["status"] == 200) {
        var result = response.body["data"];
        contactModel = ContactModel.fromJson(result);
        print(contactModel.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  Future<void> like(int id) async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider
            .getData("${AppLink.postLike}$id/${userController.user.id}");

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          await getPosts();
        }
      } else {
        showSnackBar(AppStrings.loginFirst, color: AppColor.red);
      }
    } catch (e) {
      throw Exception("Like : $e");
    }
  }

  Future<void> evaluate(num numberStar) async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider.getData(
            "${AppLink.subCategoriesEvaluate}${subCatModel.id}/${userController.user.id}/$numberStar");

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          showSnackBar(
              "${AppStrings.ratingDone} $numberStar ${AppStrings.stars}",
              color: AppColor.green,
              widget: const Icon(
                Icons.star,
                color: Colors.amber,
              ));
        }
      }
    } catch (e) {
      throw Exception("Evaluate : $e");
    }
  }

  Future<void> disLike(int id) async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider
            .getData("${AppLink.postDisLike}$id/${userController.user.id}");

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          // showSnackBar(AppStrings.addedToFavorite);
          await getPosts();
        }
      } else {
        showSnackBar(AppStrings.loginFirst, color: AppColor.red);
      }
    } catch (e) {
      throw Exception("DisLike : $e");
    }
  }

  launchCall() async {
    final url = Uri.parse('tel:${contactModel?.phone!}');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      showSnackBar(AppStrings.launchError);
      throw Exception('Could not launch $url');
    }
  }

  Future<void> lunchUrl(String link) async {
    final url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  void goToSplashReels() {
    Get.toNamed(AppRoutes.splashReel, arguments: subCatModel.id);
  }

  RxBool get isInterest {
    _isInterest = keys.contains(subCatModel.id!).obs;
    return _isInterest;
  }

  set isInterest(RxBool val) {
    _isInterest = val;
  }

  addUserInterest() {
    if (isInterest.value) {
      keys.remove(subCatModel.id!);
      Get.find<MyServices>().getBox.write(GetBoxKey.interest, keys);
      isInterest = false.obs;
      print(keys);
      FirebaseMessaging.instance.unsubscribeFromTopic("${subCatModel.id!}");
    } else {
      keys.add(subCatModel.id!);
      Get.find<MyServices>().getBox.write(GetBoxKey.interest, keys);
      isInterest = true.obs;
      FirebaseMessaging.instance.subscribeToTopic("${subCatModel.id!}");
      print(keys);
    }
    update();
  }

  @override
  void onInit() async {
    subCatModel = Get.arguments;
    await Future.wait([getPosts(), getSocial()]);
    keys = Get.find<MyServices>().getBox.read(GetBoxKey.interest) ?? [];
    print(isInterest);
    super.onInit();
  }
}
