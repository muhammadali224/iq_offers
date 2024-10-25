import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/partner__replacement_awards_model/partner_replacement_awards_model.dart';

class PartnerReplacementAwardController extends GetxController
    with StateMixin<List<PartnerReplacementAwardsModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  late int subId;
  AuthService authService = Get.find<AuthService>();

  Future<void> getCoupon() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        await _apiProvider
            .getData(AppLink.getPartnerReplacementAwards + subId.toString())
            .then((response) async {
          List<PartnerReplacementAwardsModel> couponModel = [];
          List responseList = response.body['data'];
          couponModel.addAll(responseList
              .map((e) => PartnerReplacementAwardsModel.fromJson(e)));

          change(couponModel, status: RxStatus.success());
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      }
    } catch (e) {
      throw Exception("Error Get Partner Replacement Awards : $e");
    }
    update();
  }

  @override
  void onInit() {
    subId = Get.arguments;
    getCoupon();
    super.onInit();
  }
}
