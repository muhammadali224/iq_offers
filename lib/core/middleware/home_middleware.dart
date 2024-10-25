import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../services/auth.service.dart';

class HomeMiddleware extends GetMiddleware {
  AuthService authService = Get.put(AuthService());

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authService.isTokenValid().value) {
      print(" Token is valid : ${authService.isTokenValid().value}");
      if (authService.getRoles() != null) {
        print("User Role :${authService.getRoles()}");
        if (authService.getRoles() == "3") {
          return const RouteSettings(name: AppRoutes.splash);
        } else if (authService.getRoles() == "2") {
          return const RouteSettings(name: AppRoutes.partnerHome);
        }
      }
    }
    return null;
  }
}
