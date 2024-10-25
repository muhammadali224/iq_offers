import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/account_controller/account_controller.dart';
import '../../../widget/account_tab/user_profile.dart';
import '../auth/login.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return Scaffold(
      body: GetBuilder<AccountController>(builder: (controller) {
        return Obx(() {
          return controller.authService.isTokenValid().value
              ? const UserProfile()
              : const Login();
        });
      }),
    );
  }
}
