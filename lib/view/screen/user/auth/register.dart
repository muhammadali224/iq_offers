import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/auth_controller/register_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/button_new_user.dart';
import '../../../widget/auth/new_email.dart';
import '../../../widget/auth/new_name.dart';
import '../../../widget/auth/password.dart';
import '../../../widget/auth/singup.dart';
import '../../../widget/auth/text_new.dart';
import '../../../widget/auth/user_old.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColor.primaryColor, Colors.lightBlueAccent])),
        child: ListView(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const Row(
                    children: [
                      SingUp(),
                      TextNew(),
                    ],
                  ),
                  NewName(textController: controller.nameController),
                  NewPhone(textController: controller.phoneController),
                  PasswordInput(textController: controller.passwordController),
                  ButtonNewUser(onPressed: () => controller.registerUser()),
                  const UserOld(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
