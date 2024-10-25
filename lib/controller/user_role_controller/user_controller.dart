// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/constant/get_box_key.dart';
import '../../data/model/user_model/user_model.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel = const UserModel().obs;
  RxBool userFound = false.obs;
  final _box = GetStorage();

  UserModel get user {
    try {
      final userData = _box.read(GetBoxKey.user);

      if (userData != null) {
        _userModel.value = UserModel.fromJson(userData);
        userFound = true.obs;
        print('User loaded from storage: $userData');
      } else {
        _userModel.value = const UserModel();
        userFound = false.obs;
        print('No user data found in storage');
      }
      return _userModel.value;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  set user(UserModel value) {
    _userModel.value = value;
    saveUserToStorage(value);
  }

  UserController() {
    user;
  }

  void saveUserToStorage(UserModel user) {
    try {
      _box.write(GetBoxKey.user, user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void readUserFromStorage() {
    try {
      final userData = _box.read(GetBoxKey.user);

      if (userData != null) {
        _userModel.value = UserModel.fromJson(userData);
        userFound = true.obs;
        print('User read from storage: $userData');
      } else {
        userFound = false.obs;
        print('No user data found in storage.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> clear() async {
    await _box.remove(GetBoxKey.user);
    _userModel.value = const UserModel();
    userFound = false.obs;
  }
}
