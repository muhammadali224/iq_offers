import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60, right: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            AppStrings.login,
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
