import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/auth.service.dart';
import '../../../core/services/encrypt.service.dart';
import '../../../core/services/notification.service.dart';
import '../../user_role_controller/user_controller.dart';

class QRScannerController extends GetxController {
  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  String? qrResult;
  late int subCatId;
  UserController userController = Get.find<UserController>();
  final ApiProvider _apiProvider = ApiProvider();
  AuthService authService = Get.find<AuthService>();

  Future<void> recordQR() async {
    try {
      String result = EncryptData.decryptText(qrResult!);

      String firstId = result.split("|")[0].trim();
      String userId = result.split("|")[2].trim();
      String subId = result.split("|")[1].trim();
      if (subId == subCatId.toString()) {
        if (authService.isTokenValid().value) {
          _apiProvider.updateHeader(authService.getStoredToken!.value);
          if (Get.currentRoute == AppRoutes.qrScanner) {
            await _replaceCoupon(firstId, userId);
          } else if (Get.currentRoute == AppRoutes.qrScannerAwards) {
            await _replaceAwards(firstId, userId);
          }
        }
      } else {
        showSnackBar(AppStrings.checkSub, color: Colors.red);
        AppNotifications.sendNotifications(
          title: "كوبون الخصم",
          message: AppStrings.checkSub,
          topic: "user$userId",
        );
      }
    } catch (e) {
      throw Exception("Error QR Scanner : $e");
    }
  }

  Future<void> _replaceCoupon(String id, String userID) async {
    try {
      var response =
          await _apiProvider.getData("${AppLink.replacementCoupon}$id/$userID");

      if (response.body["status"] == 200) {
        showSnackBar(AppStrings.successReplacement, color: Colors.green);
        AppNotifications.sendNotifications(
          title: "كوبون الخصم",
          message: "تم إستبدال الكوبون بنجاح",
          topic: "user$userID",
          pageId: "replacement",
          pageName: AppRoutes.coupon,
        );
      } else if (response.body["status"] == 400) {
        showSnackBar(AppStrings.couponExpired, color: Colors.red);
      } else if (response.body["status"] == 404) {
        showSnackBar(AppStrings.couponNotFound, color: Colors.red);
      } else {
        showSnackBar(AppStrings.somethingError, color: Colors.red);
      }
    } catch (e) {
      throw Exception("Error QR Scanner : $e");
    }
  }

  Future<void> _replaceAwards(String id, String userID) async {
    try {
      var response =
          await _apiProvider.getData("${AppLink.awardsReplacement}$userID/$id");
      print(response.body["status"]);
      if (response.body["status"] == 200) {
        showSnackBar(AppStrings.successReplacement, color: Colors.green);
      } else {
        showSnackBar(AppStrings.somethingError, color: Colors.red);
      }
    } catch (e) {
      throw Exception("Error QR Scanner : $e");
    }
  }

  @override
  void onInit() {
    subCatId = Get.arguments;
    super.onInit();
  }
}
