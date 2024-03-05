import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

class LocalNotificationProvider {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  Future<void> initNotification() async {
    if (!Platform.isIOS) {
      const androidSetting =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const initSettings = InitializationSettings(android: androidSetting);
      await flutterLocalNotificationsPlugin.initialize(initSettings).then((_) {
        print('setupPlugin: setup success');
      }).catchError((Object error) {
        print('Error: $error');
      });
    }
  }

  void showLocalNotification(String title, String body) {
    const androidNotificationDetail = AndroidNotificationDetails(
        '0', // channel Id
        'general' // channel Name
        );
    const iosNotificatonDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );
    flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}
