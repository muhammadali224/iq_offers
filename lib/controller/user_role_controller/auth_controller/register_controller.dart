import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/show_snackbar.dart';

class RegisterController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Future<void> registerUser() async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading.toggle();
        await _apiProvider.postData(AppLink.authRegister, {
          "UserName": nameController.text,
          "City_Id": "1",
          "Phone": phoneController.text,
          "password": passwordController.text,
        }).then((value) {
          print(value);
          if (value.body["message"] == "User successfully registered") {
            showSnackBar(AppStrings.successRegister, color: AppColor.green);
          } else if (value.body["UserName"][0] ==
              "The user name has already been taken.") {
            showSnackBar(AppStrings.inValidUserName, color: AppColor.red);
          }
        });
        isLoading.toggle();
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      throw Exception("Register : $e");
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
