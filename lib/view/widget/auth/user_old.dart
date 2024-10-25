import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_strings.dart';

class UserOld extends StatelessWidget {
  const UserOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30),
      child: Container(
        alignment: Alignment.topRight,
        child: Row(
          children: <Widget>[
            const Text(
              AppStrings.haveAccount,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                AppStrings.login,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
