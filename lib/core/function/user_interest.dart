import 'package:get_storage/get_storage.dart';

import '../constant/get_box_key.dart';

userInterest(int id) async {
  GetStorage box = GetStorage();
  List<int> interestId = box.read(GetBoxKey.interest) ?? [];

  if (interestId.contains(id)) {
    interestId.remove(id);
    box.write(GetBoxKey.interest, interestId);
  } else {
    interestId.add(id);
    box.write(GetBoxKey.interest, interestId);
  }
}
