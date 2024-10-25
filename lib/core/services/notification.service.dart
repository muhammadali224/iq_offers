import 'package:get/get.dart';

import '../class/crud.dart';
import '../constant/api_link.dart';

class AppNotifications extends GetxService {
  static final ApiProvider _apiProvider = ApiProvider();

  static Future<void> sendNotifications({
    required String title,
    required String message,
    required String topic,
    String? pageId,
    String? pageName,
  }) async {
    try {
      await _apiProvider.postData(AppLink.sendNotifications, {
        "title": title,
        "message": message,
        "topic": topic,
        "pageId": pageId ?? "",
        "pageName": pageName ?? "",
      });
    } catch (e) {
      throw Exception("Send notifications Error : $e");
    }
  }
}
