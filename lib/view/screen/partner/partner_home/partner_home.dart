import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/partner_role_controller/partner_home_controller/partner_home_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../widget/shred_component/no_data_center.dart';

class PartnerHome extends StatelessWidget {
  const PartnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    PartnerHomeController controller = Get.put(PartnerHomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.categories),
        actions: [
          TextButton(
              onPressed: () async {
                await controller.authService.logout();
                controller.update();
              },
              child: const Text(AppStrings.logout))
        ],
      ),
      body: controller.obx(
        (state) {
          if (state!.isNotEmpty) {
            return GridView.builder(
                itemCount: state.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () => controller.goToDetails(state[index]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevarmElevatedCard(
                          padding: EdgeInsets.zero,

                          child: CachedNetworkImage(
                            imageUrl: AppLink.subCategoriesImages +
                                state[index].image!,
                            fit: BoxFit.fill,
                          ),
                          // child: Text(""),
                        ),
                      ),
                    ));
          } else {
            return const NoDataCenter();
          }
        },
        onEmpty: const Text("Empty"),
        onError: (error) {
          return Text(error.toString());
        },
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
