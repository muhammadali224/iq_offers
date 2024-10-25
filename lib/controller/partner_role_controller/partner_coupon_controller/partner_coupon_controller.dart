import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/partner_coupon_model/partner_coupon_model.dart';

class PartnerCouponController extends GetxController
    with StateMixin<List<PartnerCouponModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  late int subId;
  AuthService authService = Get.find<AuthService>();

  Future<void> getCoupon() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        await _apiProvider
            .getData(AppLink.getPartnerCoupons + subId.toString())
            .then((response) async {
          List<PartnerCouponModel> couponModel = [];
          List responseList = response.body['data'];
          couponModel
              .addAll(responseList.map((e) => PartnerCouponModel.fromJson(e)));

          change(couponModel, status: RxStatus.success());
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      }
    } catch (e) {
      throw Exception("Error Get Partner Coupon : $e");
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
