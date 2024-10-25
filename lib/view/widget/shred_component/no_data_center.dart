import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/text_style.dart';
import '../../../generated/assets.dart';

class NoDataCenter extends StatelessWidget {
  const NoDataCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.lottieNoData, height: 250, width: 250),
        Text(AppStrings.noData, style: AppTextStyle.extraLargePrimaryText),
      ],
    ));
  }
}
