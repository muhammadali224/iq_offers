import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationsHelper {
  // prevent making instance
  AwesomeNotificationsHelper._();

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  /// initialize local notifications service, create channels and groups
  /// setup notifications button actions handlers
  static init() async {
    // initialize local notifications
    await _initNotification();

    // request permission to show notifications
    awesomeNotifications.requestPermissionToSendNotifications();

    // list when user click on notifications
    listenToActionButtons();
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // Only after at least the action method is set, the notification events are delivered
    awesomeNotifications.setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  ///init notifications channels
  static _initNotification() async {
    await AwesomeNotifications().setLocalization(
        languageCode: await AwesomeNotifications().getLocalization());
    await awesomeNotifications.initialize(
        "resource://drawable/app_icon",
        // null mean it will show app icon on the notification (status bar)
        [
          NotificationChannel(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            groupKey: NotificationChannels.generalGroupKey,
            channelDescription: NotificationChannels.generalChannelDescription,
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
          ),
          NotificationChannel(
            channelGroupKey: NotificationChannels.scheduleChannelGroupKey,
            channelKey: NotificationChannels.scheduleChannelKey,
            channelName: NotificationChannels.scheduleChannelName,
            groupKey: NotificationChannels.scheduleGroupKey,
            channelDescription: NotificationChannels.scheduleChannelDescription,
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            defaultRingtoneType: DefaultRingtoneType.Notification,
            enableVibration: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelGroupName: NotificationChannels.generalChannelGroupName,
          ),
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.scheduleChannelGroupKey,
            channelGroupName: NotificationChannels.scheduleChannelGroupName,
          ),
        ],
        languageCode: "ar");
  }

  //display notification for user with sound
  static showNotification(
      {required String title,
      required String body,
      required int id,
      NotificationLayout? notificationLayout,
      String? summary,
      List<NotificationActionButton>? actionButtons,
      Map<String, String>? payload,
      String? largeIcon}) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {
        // u can show notification
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: id,
            title: title,
            body: body,
            groupKey: NotificationChannels.generalGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            showWhen: true,
            payload: payload,
            notificationLayout:
                notificationLayout ?? NotificationLayout.Default,
            autoDismissible: true,
            summary: summary,
            largeIcon: largeIcon,
          ),
          actionButtons: actionButtons,
        );
      }
    });
  }

  static scheduleNotification({
    required String title,
    required String body,
    required int id,
    required DateTime date,
  }) async {
    // String localTimeZone =
    //     await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          title: title,
          body: body,
          wakeUpScreen: true,
          autoDismissible: false,
          category: NotificationCategory.Reminder,
          groupKey: NotificationChannels.scheduleChannelGroupKey,
          channelKey: NotificationChannels.scheduleChannelKey,
        ),
        schedule: NotificationCalendar
            // .fromDate(
            // date: date, allowWhileIdle: true, preciseAlarm: true));
            (
          timeZone: "GMT+03:00",
          year: date.year,
          month: date.month,
          day: date.day,
          hour: date.hour,
          minute: date.minute,
          second: date.second,
          allowWhileIdle: true,
          preciseAlarm: true,
        ));
    print(date);
  }

  static cancelScheduleNotification({required int id}) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static cancelAllScheduleNotification() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  static Future<void> getAllScheduleNotifications() async {
    List<NotificationModel> allScheduleNotifications =
        await AwesomeNotifications().listScheduledNotifications();
    print(allScheduleNotifications.length);
    print("Scheduled Notifications :$allScheduleNotifications");
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Map<String, String?>? payload = receivedAction.payload;
    // TODO handle clicking on notification
    // example
    // String routeToGetTo = payload['route'];
    // normal navigation (Get.toNamed) will throw error

    // Get.key.currentState?.pushNamed(AppRoutes.home);
  }
}

class NotificationChannels {
  // general channel (for all other notifications)
  static String get generalChannelKey => "general_channel";

  static String get generalGroupKey => "general group key";

  static String get generalChannelGroupKey => "general_channel_group";

  static String get generalChannelGroupName => "general notifications channel";

  static String get generalChannelName => "general notifications channels";

  static String get generalChannelDescription =>
      "Notification channel for general notifications";

  //schedule channel (for all scheduled notifications)
  static String get scheduleChannelKey => "scheduled";

  static String get scheduleGroupKey => "schedule group key";

  static String get scheduleChannelGroupKey => "schedule_channel_group";

  static String get scheduleChannelGroupName =>
      "schedule notifications channel";

  static String get scheduleChannelName => "schedule notifications channels";

  static String get scheduleChannelDescription =>
      "Notification channel for scheduled notifications";
}
