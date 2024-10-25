import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/partner_role_controller/partner_upload_story/partner_upload_story_controller.dart';

class PartnerUploadText extends StatelessWidget {
  const PartnerUploadText({super.key});

  @override
  Widget build(BuildContext context) {
    PartnerUploadStoryController controller =
        Get.find<PartnerUploadStoryController>();
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: controller.uploadText,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
      ),
      body: Form(
        key: controller.formKey,
        child: Center(
            child: AutoSizeTextField(
          maxLength: 1000,
          autofocus: true,
          maxFontSize: 35,
          minFontSize: 20,
          minLines: 1,
          maxLines: 7,
          style: const TextStyle(fontSize: 35, color: Colors.white),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
          ),
          controller: controller.textUploadController,
        )),
      ),
    );
  }
}
