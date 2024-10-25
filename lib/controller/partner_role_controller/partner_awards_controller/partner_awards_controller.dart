import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/partner_awards_model/partner_awards_model.dart';

class PartnerAwardController extends GetxController
    with StateMixin<List<PartnerAwardsModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  late int subId;
  AuthService authService = Get.find<AuthService>();

  Future<void> getCoupon() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        await _apiProvider
            .getData(AppLink.getPartnerAwards + subId.toString())
            .then((response) async {
          List<PartnerAwardsModel> couponModel = [];
          List responseList = response.body['data'];
          couponModel
              .addAll(responseList.map((e) => PartnerAwardsModel.fromJson(e)));

          change(couponModel, status: RxStatus.success());
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      }
    } catch (e) {
      throw Exception("Error Get Partner Awards : $e");
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
