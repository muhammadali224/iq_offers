import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constant/get_box_key.dart';

import '../../firebase_options.dart';
import 'awesome_notification_helper.dart';
import 'fcm_helper.dart';

class MyServices extends GetxService {
  late GetStorage getBox;

  Future<MyServices> init() async {
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    getBox = GetStorage();
    getBox.write(GetBoxKey.language, "ar");
    await FcmHelper.initFcm();
    await AwesomeNotificationsHelper.init();
    FirebaseMessaging.instance.subscribeToTopic("all");
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
