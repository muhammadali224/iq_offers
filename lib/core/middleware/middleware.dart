import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/app.service.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // if (myServices.sharedPref.getString('step') == "2") {
    //   return const RouteSettings(name: AppRoutes.home);
    // }
    // if (myServices.sharedPref.getString('step') == "1") {
    //   return const RouteSettings(name: AppRoutes.login);
    // }

    return null;
  }
}
