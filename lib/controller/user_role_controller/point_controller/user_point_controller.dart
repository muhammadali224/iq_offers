import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/points_model/points_model.dart';
import '../../user_role_controller/user_controller.dart';

class UserPointController extends GetxController
    with StateMixin<List<PointsModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  int totalPoint = 0;
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();

  Future<void> getPoints() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        await _apiProvider
            .getData("${AppLink.getPoints}${userController.user.id}")
            .then((response) async {
          List<PointsModel> pointList = [];
          List responseList = response.body['data'];
          pointList.addAll(responseList.map((e) => PointsModel.fromJson(e)));
          totalPoint = int.parse(pointList[0].totalPoint!);
          change(pointList, status: RxStatus.success());

          print(pointList.toString());
          print(totalPoint);
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      } else {
        showSnackBar(AppStrings.loginFirst, color: AppColor.red);
      }
    } catch (e) {
      throw Exception("Error Get Points : $e");
    }
    update();
  }

  @override
  void onInit() {
    getPoints();
    super.onInit();
  }
}
