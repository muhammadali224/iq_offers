import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../data/model/video_model/video_model.dart';
import '../../../view/screen/user/reels/reels.dart';

class ReelsController extends GetxController with StateMixin<List<VideoModel>> {
  int? id;
  final ApiProvider _apiProvider = ApiProvider();
  int currentIndex = 0;

  Future<Widget> futureCallback() async {
    await getVideos();
    return Future.value(const ReelsView());
  }

  Future<void> getVideos() async {
    try {
      await _apiProvider
          .getData(
              id == null ? AppLink.suggestReels : "${AppLink.videoIndex}$id")
          .then((response) {
        List<VideoModel> videoList = [];
        List responseList = response.body[id == null ? 'data' : 'result'];

        videoList.addAll(responseList.map((e) => VideoModel.fromJson(e)));

        change(videoList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
    update();
  }

  changeIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    id = Get.arguments;
    super.onInit();
  }
}
