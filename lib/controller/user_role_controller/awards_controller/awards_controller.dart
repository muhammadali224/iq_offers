import 'dart:async';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/services/auth.service.dart';
import '../../../data/model/awards_model/awards_model.dart';
import '../../qr_controller/qr_controller.dart';
import '../../user_role_controller/user_controller.dart';

class AwardsController extends GetxController
    with StateMixin<List<AwardsModel>> {
  final ApiProvider _apiProvider = ApiProvider();
  AuthService authService = Get.find<AuthService>();
  UserController userController = Get.find<UserController>();
  AppQrController appQrController = Get.put(AppQrController());
  int totalPoints = 0;

  Future<void> getAwards() async {
    try {
      await _apiProvider.getData(AppLink.getAwards).then((response) async {
        await _getUserPointCount();
        List<AwardsModel> awardsList = [];
        List responseList = response.body['data'];
        awardsList.addAll(responseList.map((e) => AwardsModel.fromJson(e)));
        for (var post in awardsList) {
          startTimer(post);
        }
        change(awardsList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception("Error Get Awards : $e");
    }
    update();
  }

  Future<void> _getUserPointCount() async {
    try {
      if (authService.isTokenValid().value) {
        _apiProvider.updateHeader(authService.getStoredToken!.value);
        var response = await _apiProvider.getData(
            AppLink.getTotalPoints + userController.user.id.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          totalPoints = int.parse(response.body["TotalPoints"] ?? "0");
        }
      }
    } catch (e) {
      throw Exception("Error Get Total Points : $e");
    }
    update();
  }

  void startTimer(AwardsModel post) {
    DateTime expirationDate = post.expiredDate!;
    DateTime currentDate = DateTime.now();

    // Calculate time remaining in seconds
    int secondsRemaining = expirationDate.difference(currentDate).inSeconds;

    // Start the timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        update(); // Trigger a rebuild to update the UI
      } else {
        timer.cancel();
      }
    });
  }

  String getTimeRemaining(AwardsModel award) {
    int secondsRemaining =
        award.expiredDate!.difference(DateTime.now()).inSeconds;
    return formatDuration(secondsRemaining);
  }

  String formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String days = (duration.inDays > 0) ? '${duration.inDays} يوم ' : '';
    String hours =
        '${duration.inHours.remainder(24).toString().padLeft(2, '0')}:';
    String minutes =
        '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:';
    String secondsStr = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$days$hours$minutes$secondsStr';
  }

  bool isAwardsValid(AwardsModel e) {
    return e.expiredDate!.isAfter(DateTime.now()) &&
        e.startDate!.isBefore(DateTime.now());
  }

  @override
  void onInit() {
    Jiffy.setLocale("ar");
    getAwards();

    super.onInit();
  }
}
