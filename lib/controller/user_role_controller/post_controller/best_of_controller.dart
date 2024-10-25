import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../../data/model/suggest_post_model/suggest_post_model.dart';

class BestOfController extends GetxController
    with StateMixin<List<SuggestPostModel>> {
  final ApiProvider _apiProvider = ApiProvider();

  Future<void> getPosts() async {
    try {
      await _apiProvider.getData(AppLink.postSuggest).then((response) {
        List<SuggestPostModel> postList = [];
        List responseList = response.body['Posts'];

        postList.addAll(responseList.map((e) => SuggestPostModel.fromJson(e)));

        change(postList, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }
}
