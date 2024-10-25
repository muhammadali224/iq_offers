import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/auth.service.dart';
import '../../user_role_controller/user_controller.dart';

class AddPointsController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  Future<void> addPoints({required int count, required String desc}) async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider.postData(AppLink.addPoints, {
          "Description": desc,
          "Count": count,
          "Expired_Date":
              DateTime.now().add(const Duration(days: 30)).toString(),
          "Start_Date": DateTime.now().toString(),
          "User_Id": userController.user.id,
        });

        if (response.statusCode! == 200 || response.statusCode! == 201) {
          showSnackBar(AppStrings.successAddPoints, color: AppColor.green);
        } else {
          showSnackBar(AppStrings.somethingError, color: AppColor.red);
        }
      } else {
        showSnackBar(AppStrings.loginFirst, color: AppColor.red);
      }
    } catch (e) {
      throw Exception("Like : $e");
    }
  }
}
