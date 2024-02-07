import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/alert.dart';

class AlertRepository {
  static const String _alertsKey = 'alerts';

  Future<void> saveAlert(Alert alert) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> alertsList = prefs.getStringList(_alertsKey) ?? [];
      final String alertJson = json.encode(alert.toMap());
      alertsList.add(alertJson);
      await prefs.setStringList(_alertsKey, alertsList);
    } on Exception catch (e) {
      throw Exception('Failed to save alert: $e');
    }
  }

  Future<List<Alert>> getAlerts() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> alertsList = prefs.getStringList(_alertsKey) ?? [];

      return alertsList
          .map(
            (alertJson) => Alert(
              stockSymbol: json.decode(alertJson)['stockSymbol'],
              alertPrice: json.decode(alertJson)['alertPrice'],
              lastPrice: json.decode(alertJson)['lastPrice'],
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to get alerts: $e');
    }
  }
}
