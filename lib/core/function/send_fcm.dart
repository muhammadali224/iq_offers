import 'dart:convert';

import 'package:http/http.dart' as http;

sendFCM(
    {required String topic,
    required String title,
    required String body,
    String? pageId,
    String? pageName}) async {
  String fcmUrl = "https://fcm.googleapis.com/fcm/send";
  String fcmKey =
      "AAAAOJPoKz8:APA91bHO0WPK-rO3Q31jm6-kprUTzf5BgNROFySg3YzQj28a3yRRWYK3CMRM5afxUti6Y82EPq_XN88DAJ5sTl0L_axfijmEKJdp4wHGBgaD_bkUsgGFmQ_2iZKm4bgXq6IJuaFJl9J8";
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$fcmKey'
  };
  final Map<String, dynamic> message = {
    "to": "/topics/$topic",
    "priority": "high",
    'content_available': true,
    "notification": {
      "title": title,
      "body": body,
      "sound": "default",
    },
    "data": {
      "page_id": pageId,
      "page_name": pageName,
    }
  };
  try {
    var response = await http.post(Uri.parse(fcmUrl),
        headers: headers, body: jsonEncode(message));
    print(response.body);
    if (response.statusCode == 200) {}
  } catch (e) {
    throw Exception(e.toString());
  }
}
