import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/partner_role_controller/qr_scanner_controller/qr_scanner_controller.dart';

class QRMobileScanner extends StatelessWidget {
  const QRMobileScanner({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QRScannerController());
    return GetBuilder<QRScannerController>(builder: (controller) {
      return Scaffold(
        body: AiBarcodeScanner(
          onScan: (String val) {
            print(val);
          },
          bottomBarText: "إمسح رمز QR من تطبيق IQ Offers",
          onDetect: (BarcodeCapture capture) async {
            final List<Barcode> barcodes = capture.barcodes;
            controller.cameraController.stop();
            controller.cameraController.dispose();
            for (final barcode in barcodes) {
              controller.qrResult = barcode.rawValue;
              print(controller.qrResult);
            }
            await controller.recordQR();
          },
        ),
      );
    });
  }
}
