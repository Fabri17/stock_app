import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_icon');
    const iOSInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );
    await _localNotificationService.initialize(settings);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'stock_app_id',
      'Notificaciones',
      channelDescription:
          'Notificaciones de la aplicación de cotizaciones de acciones',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ledColor: Colors.orange,
      ledOnMs: 250,
      ledOffMs: 250,
      number: 1,
    );
    const iOSNotificationDetails = DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iOSNotificationDetails);
  }

  Future<void> showNotifications({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }
}
