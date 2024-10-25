import 'package:get/get.dart';

import '../constant/app_strings.dart';

validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return AppStrings.emailValidError;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return AppStrings.phoneValidError;
    }
  }

  if (val.isEmpty) {
    return AppStrings.emptyValidError;
  }
  if (val.length < min) {
    return AppStrings.minValidError + min.toString();
  }
  if (val.length > max) {
    return AppStrings.maxValidError + max.toString();
  }
}
