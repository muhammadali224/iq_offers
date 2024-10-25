import 'package:get/get.dart';

import '../constant/get_box_key.dart';
import '../services/app.service.dart';

class ApiProvider extends GetConnect implements GetxService {
  MyServices myServices = Get.find<MyServices>();
  late String token;

  late Map<String, String> _mainHeaders;

  ApiProvider() {
    timeout = const Duration(seconds: 15);
    token = myServices.getBox.read(GetBoxKey.token) ?? "";
    _mainHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token",
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(
        uri,
        headers: headers ?? _mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(
        uri,
        body,
        headers: _mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFile(String uri, Map<String, dynamic> body) async {
    try {
      // double progressVal = 0.0;
      Response response = await post(
        uri,
        FormData(body),
        headers: _mainHeaders,
        // uploadProgress: (val) {
        //   progressVal = val;
        // },
      );
      return (response);
    } catch (e) {
      return (Response(statusCode: 1, statusText: e.toString()));
    }
  }
}
