import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/coupon_model/coupon_model.dart';
import '../../qr_controller/qr_controller.dart';
import '../../user_role_controller/user_controller.dart';

class CouponController extends GetxController
    with StateMixin<List<CouponModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  int totalPoint = 0;
  AppQrController appQrController = Get.put(AppQrController());
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  Future<void> getCoupon() async {
    try {
      await _apiProvider
          .getData(authService.isTokenValid().value
              ? "${AppLink.getUserCoupon}${userController.user.id}"
              : AppLink.getCoupon)
          .then((response) async {
        List<CouponModel> couponModel = [];
        List responseList = response.body['data'];
        couponModel.addAll(responseList.map((e) => CouponModel.fromJson(e)));

        change(couponModel, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception("Error Get Coupon : $e");
    }
    update();
  }

  @override
  void onInit() async {
    await getCoupon();

    super.onInit();
  }
}
