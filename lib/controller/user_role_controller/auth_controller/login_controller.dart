import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/user_model/user_model.dart';
import '../user_controller.dart';

class LoginController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  Future<void> loginUser() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.toggle();

        var response = await _apiProvider.postData(AppLink.authLogin, {
          "UserName": nameController.text,
          "password": passwordController.text,
        });

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          await userController.clear();
          userController.user = UserModel.fromJson(response.body["user"]);
          showSnackBar(AppStrings.successLogin, color: AppColor.green);
          await authService.saveToken(
              response.body["access_token"], response.body["expires_in"]);
          FirebaseMessaging.instance
              .subscribeToTopic("user${userController.user.id}");
          update();
          Get.offAllNamed(AppRoutes.home);
        } else if (response.statusCode! > 400) {
          showSnackBar(AppStrings.inValidLogin, color: AppColor.red);
        }

        isLoading.toggle();
      }
    } catch (e) {
      isLoading.toggle();
      throw Exception("Login : $e");
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
