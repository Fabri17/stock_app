import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';

part 'alert_event.dart';
part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  final Future<void> Function(Alert alert) _saveAlert;
  final Future<void> Function() _getAlerts;

  AlertBloc({
    required Future<void> Function(Alert alert) saveAlert,
    required Future<void> Function() getAlerts,
  })  : _saveAlert = saveAlert,
        _getAlerts = getAlerts,
        super(const AlertState()) {
    on<AddAlertEvent>(_onAddAlertHandler);
    on<AlertsRequested>(_onAlertsRequestedHandler);
  }

  Future<void> addAlert(Alert alert) async {
    try {
      add(AddAlertEvent(alert));
    } on Exception catch (e) {
      throw Exception("Failed to save alert: $e");
    }
  }

  Future<List<Alert>> getAlerts() async {
    try {
      add(AlertsRequested(alerts: state.alerts));
      return state.alerts;
    } on Exception catch (e) {
      throw Exception("Failed to get alerts: $e");
    }
  }

  Future<void> _onAddAlertHandler(
    AddAlertEvent event,
    Emitter<AlertState> emit,
  ) async {
    emit(state.copyWith(alerts: state.alerts + [event.alert]));
  }

  FutureOr<void> _onAlertsRequestedHandler(
    AlertsRequested event,
    Emitter<AlertState> emit,
  ) {
    emit(state.copyWith(alerts: event.alerts));
  }
}