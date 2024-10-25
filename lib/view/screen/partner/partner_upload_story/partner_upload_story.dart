import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/partner_role_controller/partner_upload_story/partner_upload_story_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/extension/space_extension.dart';

class PartnerUploadStory extends StatelessWidget {
  const PartnerUploadStory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PartnerUploadStoryController());

    return Scaffold(
      backgroundColor: ElevarmColors.neutral100,
      appBar: AppBar(
        backgroundColor: ElevarmColors.neutral100,
        surfaceTintColor: ElevarmColors.neutral100,
        title: const Text(AppStrings.uploadStory),
      ),
      body: GetBuilder<PartnerUploadStoryController>(
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                if (controller.file == null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevarmPrimaryButton.icon(
                      text: 'إضافة حالة نصية',
                      onPressed: () {
                        Get.toNamed(AppRoutes.uploadText);
                      },
                      buttonThemeData: const ElevarmPrimaryButtonThemeData(
                        primaryColor: ElevarmColors.danger,
                      ),
                      leadingIconAssetName: null,
                      trailingIconAssetName: null,
                    ),
                  ),
                15.height,
                controller.file == null
                    ? Column(
                        children: [
                          ElevarmInputFileCard(
                            onTap: controller.pickImage,
                            clickToUploadLabel: "إضغط هنا لأختيار صورة",
                            orDragAndDropLabel: "",
                            subtitle: 'PNG, JPG or GIF',
                          ),
                          10.height,
                          ElevarmInputFileCard(
                            onTap: controller.pickVideo,
                            clickToUploadLabel: "إضغط هنا لأختيار فيديو",
                            orDragAndDropLabel: "",
                            subtitle: 'MP4',
                          ),
                        ],
                      )
                    : Obx(() {
                        return ElevarmFileUploadCard(
                          title: controller.fileName!,
                          subtitle:
                              controller.textUploadController.text.isNotEmpty
                                  ? controller.textUploadController.text
                                  : "إضغط للتحميل",
                          actionIconAssetName: Icons.delete,
                          isLoading: controller.isLoading.value,
                          onTap: controller.fileType == "image"
                              ? controller.uploadImage
                              : controller.uploadVideo,
                          loadingProgress: (controller.progressVal.value / 100),
                          onTapAction: controller.deleteFile,
                        );
                      }),
                30.height,
                if (controller.file != null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevarmPrimaryButton.icon(
                      text: controller.textUploadController.text.isEmpty
                          ? AppStrings.addDescreption
                          : AppStrings.upload,
                      onPressed: () {
                        controller.textUploadController.text.isEmpty
                            ? viewDescModelSheet(context, controller)
                            : controller.fileType == "image"
                                ? controller.uploadImage()
                                : controller.uploadVideo();
                      },
                      buttonThemeData: const ElevarmPrimaryButtonThemeData(
                        primaryColor: ElevarmColors.danger,
                      ),
                      leadingIconAssetName: null,
                      trailingIconAssetName: null,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void viewDescModelSheet(
      BuildContext context, PartnerUploadStoryController controller) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      elevation: 15,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15), right: Radius.circular(15))),
      builder: (context) => Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 15,
            right: 15),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const Text(AppStrings.addDescreption,
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevarmTextInputField(
                hintText: 'أضف وصف للصورة او الفيديو',
                autofocus: true,
                minLines: 1,
                maxLines: 5,
                controller: controller.textUploadController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
