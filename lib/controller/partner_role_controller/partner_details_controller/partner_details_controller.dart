import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/sub_cat_model/sub_cat_model.dart';

class PartnerDetailsController extends GetxController {
  late SubCatModel subModel;
  final ApiProvider _apiProvider = ApiProvider();
  RxString totalPoints = "0".obs;
  RxInt countRewards = 0.obs;
  RxInt countRewardReplacements = 0.obs;
  RxInt countCoupons = 0.obs;
  RxMap<String, double> dataMap = <String, double>{
    AppStrings.totalPoints: 0,
    AppStrings.countRewards: 0,
    AppStrings.countReplacementsRewards: 0,
    AppStrings.countCoupons: 0,
  }.obs;
  RxList<String> names = <String>[
    AppStrings.points,
    AppStrings.awards,
    AppStrings.replacementAwards,
    AppStrings.coupons,
  ].obs;

  Future<void> getSummery() async {
    try {
      var response = await _apiProvider
          .getData(AppLink.getPartnerSummery + subModel.id.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        totalPoints.value = response.body["TotalPoints"] ?? "0";
        countRewards.value = response.body["CountRewards"];
        countRewardReplacements.value =
            response.body["CountRewardReplacements"];
        countCoupons.value = response.body["CountCoupons"];

        dataMap.value = {
          AppStrings.totalPoints: double.parse(totalPoints.value),
          AppStrings.countRewards: countRewards.toDouble(),
          AppStrings.countReplacementsRewards:
              countRewardReplacements.toDouble(),
          AppStrings.countCoupons: countCoupons.toDouble(),
        };
        update();
      }
    } catch (e) {
      throw Exception("Error getting Summery $e");
    }
  }

  goToRoute(int index) {
    switch (index) {
      case 1:
        Get.toNamed(AppRoutes.partnerAwards, arguments: subModel.id!);
        break;
      case 2:
        Get.toNamed(AppRoutes.partnerReplacementAwards,
            arguments: subModel.id!);
        break;
      case 3:
        Get.toNamed(AppRoutes.partnerCoupon, arguments: subModel.id!);
        break;
      case 4:
        Get.toNamed(AppRoutes.qrScanner, arguments: subModel.id!);
        break;
      case 5:
        Get.toNamed(AppRoutes.qrScannerAwards, arguments: subModel.id!);
        break;
      case 6:
        Get.toNamed(AppRoutes.uploadStory, arguments: subModel.id!);
        break;
      default:
        null;
    }
  }

  @override
  void onInit() {
    subModel = Get.arguments;
    getSummery();
    super.onInit();
  }
}
