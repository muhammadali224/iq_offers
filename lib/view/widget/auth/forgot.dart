import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';

class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 50),
      child: Container(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {},
          child: const Text(
            AppStrings.forgetPassword,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
