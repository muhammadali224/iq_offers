import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controller/user_role_controller/coupon_controller/coupon_controller.dart';
import 'app.service.dart';
import 'awesome_notification_helper.dart';

class FcmHelper {
  // prevent making instance
  FcmHelper._();

  // FCM Messaging
  static late FirebaseMessaging messaging;

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      // initialize firebase
      messaging = FirebaseMessaging.instance;

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      await _generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      // Logger().e(error);
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  static Future<void> _generateFcmToken() async {
    try {
      var token = await messaging.getToken();
      if (token != null) {
        Get.find<MyServices>().getBox.write("token", token);

        _sendFcmTokenToServer();
      } else {
        // retry generating token
        await Future.delayed(const Duration(seconds: 5));
        _generateFcmToken();
      }
    } catch (error) {
      // Logger().e(error);
    }
  }

  static _sendFcmTokenToServer() {
    Get.find<MyServices>().getBox.read("token");
  }

  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    var finalId = UniqueKey().hashCode;
    AwesomeNotificationsHelper.showNotification(
      id: finalId,
      title: message.notification!.title!,
      body: message.notification!.body!,
      summary: message.notification?.title,
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    if (message.data['pageid'] == "replacement" &&
        message.data['pagename'] == "/coupon") {
      Get.find<CouponController>().getCoupon();
    }
    var finalId = UniqueKey().hashCode;
    AwesomeNotificationsHelper.showNotification(
      id: finalId,
      summary: message.notification!.title!,
      title: message.notification!.title!,
      body: message.notification!.body!,
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
  }
}
