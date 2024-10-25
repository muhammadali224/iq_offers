import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user_role_controller/post_controller/best_of_controller.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../widget/best_of/suggest_post_container.dart';
import '../../../widget/shred_component/no_data_center.dart';

class BestOf extends StatelessWidget {
  const BestOf({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BestOfController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bestOffers),
      ),
      body: GetBuilder<BestOfController>(builder: (controller) {
        return ListView(
          shrinkWrap: true,
          children: [
            controller.obx(
              (state) {
                if (state!.isNotEmpty) {
                  return Column(
                    children: state
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SuggestPostContainer(
                                e: e,
                              ),
                            ))
                        .toList(),
                  );
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
          ],
        );
      }),
    );
  }
}
