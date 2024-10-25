import 'package:get/get.dart';

import '../controller/user_role_controller/home_controller/home_controller.dart';
import '../controller/user_role_controller/user_controller.dart';
import '../core/class/crud.dart';
import '../core/services/auth.service.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
    Get.put(HomeController());
    Get.put<UserController>(UserController());
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}
