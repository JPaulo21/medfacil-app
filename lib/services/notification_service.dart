import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NotificationDetails platformChannelSpecifics;


  Future<bool> initializeNotificationsChannel() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      const androidInitializationSettings = AndroidInitializationSettings('@mipmap/launcher_icon');
      const initializationSettings = InitializationSettings(android: androidInitializationSettings);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '3228c0e595837fb18f48472a6eed17fd',
        'CODE_NOTIFICATION',
        importance: Importance.max,
        priority: Priority.high,
      );

      platformChannelSpecifics = const NotificationDetails(android: androidPlatformChannelSpecifics);
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<void> showNotification(String message) async {
    try {
      await flutterLocalNotificationsPlugin.show(
        0,
        'Código de acesso:',
        message,
        platformChannelSpecifics,
      );
    } catch (e) {
      print(e);
    }
  }

}