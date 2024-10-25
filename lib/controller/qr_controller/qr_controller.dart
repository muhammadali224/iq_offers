import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../core/constant/app_strings.dart';
import '../../core/constant/color.dart';
import '../../core/function/show_snackbar.dart';
import '../../core/services/auth.service.dart';
import '../../core/services/encrypt.service.dart';
import '../../generated/assets.dart';
import '../user_role_controller/user_controller.dart';

class AppQrController extends GetxController {
  UserController userController = Get.find<UserController>();
  QrImage? qrImage;
  final RxString qrCodeData = ''.obs;
  AuthService authService = Get.find<AuthService>();

  void _generateQRCode(String id) {
    String planText = "$id|${userController.user.id}";
    Encrypted encrypted = EncryptData.encryptWithAES(planText);
    String encryptedData = encrypted.base64;
    qrCodeData.value = encryptedData;
  }

  showQRCode(String id) {
    if (!authService.isTokenValid().value) {
      showSnackBar(AppStrings.loginFirst, color: AppColor.red);
    } else {
      _generateQRCode(id.toString());
      final qrCode = QrCode(
        8,
        QrErrorCorrectLevel.H,
      )..addData(qrCodeData.value);

      qrImage = QrImage(qrCode);
      showDialog(
        builder: (_) => Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: PrettyQrView(
              qrImage: qrImage!,
              decoration: const PrettyQrDecoration(
                  image: PrettyQrDecorationImage(
                image: AssetImage(Assets.imagesOffersLogo),
              )),
            ),
          ),
        ),
        context: Get.context!,
      );
    }
  }
}
