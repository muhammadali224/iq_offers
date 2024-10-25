import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/show_snackbar.dart';

class PartnerUploadStoryController extends GetxController {
  late int subId;
  final ApiProvider _apiProvider = ApiProvider();
  TextEditingController textUploadController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;
  String? fileName;
  String? fileType;
  RxDouble progressVal = 0.0.obs;
  RxBool isLoading = false.obs;

  Future<void> uploadText() async {
    try {
      if (formKey.currentState!.validate()) {
        var response = await _apiProvider.postData(AppLink.addStory, {
          "Content": textUploadController.text,
          "SubCategory_Id": subId,
        });
        if ((response.statusCode == 200 || response.statusCode == 201) &&
            response.body["message"] == "Successfully") {
          textUploadController.clear();
          Get.back();
          showSnackBar("تم إضافة الحالة بنجاح", color: Colors.green);
        }
      }
    } catch (e) {
      throw Exception("Error Upload Text : $e");
    }
  }

  Future<void> uploadImage() async {
    try {
      if (file != null) {
        isLoading.toggle();
        var response = await _apiProvider.post(
          AppLink.addStory,
          FormData({
            "Content": textUploadController.text,
            "Image": MultipartFile(file, filename: fileName!),
            "SubCategory_Id": subId.toString(),
          }),
          uploadProgress: (val) {
            progressVal = val.obs;
          },
        );
        update();
        print(response.body);
        if ((response.statusCode == 200 || response.statusCode == 201) &&
            response.body["message"] == "Successfully") {
          textUploadController.clear();
          file = null;
          fileName = null;

          showSnackBar("تم إضافة الحالة بنجاح", color: Colors.green);
        }
      }
    } catch (e) {
      throw Exception("Error Upload Images : $e");
    }
    isLoading.toggle();
    update();
  }

  Future<void> uploadVideo() async {
    try {
      if (file != null) {
        isLoading.toggle();
        var response = await _apiProvider.post(
          AppLink.addStory,
          FormData({
            "Content": textUploadController.text,
            "Video": MultipartFile(file, filename: fileName!),
            "SubCategory_Id": subId.toString(),
          }),
        );

        print(response.body);
        print(response.statusCode);
        if ((response.statusCode == 200 || response.statusCode == 201) &&
            response.body["message"] == "Successfully") {
          textUploadController.clear();
          file = null;
          fileName = null;

          showSnackBar("تم إضافة الحالة بنجاح", color: Colors.green);
        }
      }
    } catch (e) {
      throw Exception("Error Upload Video : $e");
    }
    isLoading.toggle();
    update();
  }

  void pickImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile?.path == null) {
      showSnackBar(
        "لم تقم بإختيار صورة",
        color: Colors.red,
      );
    } else {
      fileName = xFile!.name;
      fileType = "image";
      file = File(xFile.path);
      update();
    }
    update();
  }

  void pickVideo() async {
    XFile? xFile = await ImagePicker().pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 30));
    if (xFile?.path == null) {
      showSnackBar(
        "لم تقم بإختيار فيديو",
        color: Colors.red,
      );
    } else {
      fileName = xFile!.name;
      fileType = "video";
      file = File(xFile.path);
      update();
    }
    update();
  }

  void deleteFile() {
    file = null;
    update();
  }

  @override
  void onInit() {
    subId = Get.arguments;
    super.onInit();
  }

  @override
  void dispose() {
    textUploadController.dispose();
    super.dispose();
  }
}
