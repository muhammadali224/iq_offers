import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/services/auth.service.dart';
import '../user_controller.dart';

class AccountController extends GetxController {
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  void goToMyPoints() {
    Get.toNamed(AppRoutes.myPoints);
  }

  void goToMyFavorites() {
    Get.toNamed(AppRoutes.favoriteReels);
  }

  @override
  void onInit() {
    if (!authService.isTokenValid().value) {
      authService.logout();
    }
    super.onInit();
  }
}
