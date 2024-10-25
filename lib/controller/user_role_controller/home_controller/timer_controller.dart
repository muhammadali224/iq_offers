import 'dart:async';

import 'package:get/get.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/get_box_key.dart';
import '../../../core/function/show_snackbar.dart';
import '../../../core/services/app.service.dart';
import '../../../core/services/auth.service.dart';
import '../point_controller/add_points_controller.dart';

class AppTimerController extends GetxController {
  RxBool canGetPrize = true.obs;
  RxString eta = ''.obs;

  final box = Get.find<MyServices>().getBox;
  AuthService authService = Get.find<AuthService>();
  final AddPointsController _addPointsController =
      Get.put(AddPointsController());

  @override
  void onInit() {
    canGetPrize.value = box.read(GetBoxKey.canGetPrize) ?? true;
    _loadTimerState();

    super.onInit();
  }

  Future<void> _loadTimerState() async {
    try {
      String? nextPrize = box.read(GetBoxKey.nextPrizeTime);

      if (nextPrize != null) {
        DateTime? nextPrizeTime = DateTime.parse(nextPrize);

        DateTime now = DateTime.now();

        if (now.isAfter(nextPrizeTime)) {
          // User can get the prize now
          canGetPrize.value = true;
          await box.write(GetBoxKey.canGetPrize, true);
        } else {
          // Calculate ETA
          _startEtaTimer(nextPrizeTime);
        }
      }

      update();
    } catch (e) {
      throw Exception("Error Load Timer $e");
    }
  }

  void getPrize() async {
    try {
      if (!authService.isTokenValid().value) {
        showSnackBar(AppStrings.loginFirst, color: AppColor.red);
      } else {
        await _addPointsController.addPoints(count: 5, desc: "مكافئة بومية");

        DateTime nextPrizeTime = DateTime.now().add(const Duration(days: 1));
        box.write(GetBoxKey.nextPrizeTime, nextPrizeTime.toString());

        canGetPrize.value = false;
        await box.write(GetBoxKey.canGetPrize, false);

        _startEtaTimer(nextPrizeTime);
      }
    } catch (e) {
      throw Exception("Error Get Prize $e");
    }
  }

  void _startEtaTimer(DateTime targetTime) {
    try {
      Timer.periodic(const Duration(seconds: 1), (Timer t) async {
        DateTime now = DateTime.now();
        Duration difference = targetTime.difference(now);

        if (difference.isNegative) {
          t.cancel();
          canGetPrize.value = true;
          await box.write(GetBoxKey.canGetPrize, true);
          eta.value = '';
          box.remove(GetBoxKey.nextPrizeTime);
        } else {
          eta.value = _formatDuration(difference);
        }
      });
    } catch (e) {
      throw Exception("Error Start ETA Timer $e");
    }
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
