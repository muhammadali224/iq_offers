import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle largeBlackText = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.black);
  static TextStyle largePrimaryText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: AppColor.primaryColor);
  static TextStyle smallBlackText =
      TextStyle(fontSize: 18, color: AppColor.black);
  static TextStyle smallPrimaryText =
      TextStyle(fontSize: 18, color: AppColor.primaryColor);
  static TextStyle extraLargePrimaryText = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: AppColor.primaryColor);
  static TextStyle titleBlackText =
      TextStyle(fontSize: 20, color: AppColor.black);
  static TextStyle titlePrimaryText =
      TextStyle(fontSize: 20, color: AppColor.primaryColor);
}
