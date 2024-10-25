import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/auth_controller/login_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/button.dart';
import '../../../widget/auth/first.dart';
import '../../../widget/auth/input_email.dart';
import '../../../widget/auth/password.dart';
import '../../../widget/auth/text_login.dart';
import '../../../widget/auth/vertical_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppColor.primaryColor, Colors.lightBlueAccent])),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const Row(
              children: [
                VerticalText(),
                TextLogin(),
              ],
            ),
            InputEmail(textController: controller.nameController),
            PasswordInput(textController: controller.passwordController),
            // Forgot(),
            ButtonLogin(onPressed: () => controller.loginUser()),
            const FirstTime(),
          ],
        ),
      ),
    );
  }
}
