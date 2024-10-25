import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_role_controller/auth_controller/register_controller.dart';
import '../../../core/constant/app_strings.dart';

class ButtonNewUser extends GetView<RegisterController> {
  final void Function() onPressed;

  const ButtonNewUser({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.bottomRight,
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: const Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: controller.isLoading.value == false
              ? TextButton(
                  onPressed: onPressed,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.register,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }
}
