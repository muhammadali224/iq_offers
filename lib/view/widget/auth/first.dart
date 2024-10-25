import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/routes.dart';
import '../../../core/extension/space_extension.dart';

class FirstTime extends StatelessWidget {
  const FirstTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30),
      child: Container(
        alignment: Alignment.topRight,
        // height: 20,
        child: Row(
          children: [
            const Text(
              AppStrings.donHaveAccount,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            10.width,
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.register);
              },
              child: const Text(
                AppStrings.register,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
