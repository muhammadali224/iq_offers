import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/user_role_controller/user_controller.dart';
import '../class/crud.dart';
import '../constant/api_link.dart';
import '../constant/get_box_key.dart';
import '../constant/routes.dart';

class AuthService extends GetxService {
  final box = GetStorage();
  final ApiProvider _apiProvider = ApiProvider();

  UserController userController = Get.put(UserController());

  Future<void> saveToken(String token, int tokenExpire) async {
    box.write(GetBoxKey.token, token);

    box.write(GetBoxKey.tokenExpireIn,
        DateTime.now().add(Duration(seconds: tokenExpire)).toString());
    userController.userFound = true.obs;
    getRoles();
  }

  RxString? get getStoredToken {
    String? token = box.read(GetBoxKey.token);
    print(token);
    return token?.obs;
  }

  RxBool isTokenValid() {
    RxString? tokenData = getStoredToken;
    if (tokenData == null) {
      return false.obs;
    }

    final expirationString = box.read(GetBoxKey.tokenExpireIn);
    RxBool result =
        DateTime.now().isBefore(DateTime.parse(expirationString)).obs;
    // if (result.value == false) {
    //   logout();
    // }
    return result;
  }

  Future<void> _logoutToken() async {
    box.remove(GetBoxKey.token);
    box.remove(GetBoxKey.tokenExpireIn);
    await userController.clear();
  }

  String? getRoles() {
    if (userController.userFound.value) {
      return userController.user.roleId;
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      if (isTokenValid().value) {
        _apiProvider.updateHeader(getStoredToken!.value);
        await _apiProvider.postData(AppLink.authLogout, {});
        await _logoutToken();
        Get.offAllNamed(AppRoutes.home);
      } else {
        await _logoutToken();
        Get.offAllNamed(AppRoutes.home);
      }
      FirebaseMessaging.instance
          .unsubscribeFromTopic("user${userController.user.id}");
    } catch (e) {
      throw Exception("Logout :$e");
    }
  }
}
