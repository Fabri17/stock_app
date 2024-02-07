import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/alert_repository.dart';
import '../../../domain/services/i_web_socket_service.dart';

import '../../../domain/entities/entities.dart';

part 'alert_event.dart';
part 'alert_state.dart';

class AlertBloc extends Bloc<AlertEvent, AlertState> {
  final AlertRepository _alertRepository;
  final IWebSocketService _webSocketService;

  AlertBloc({
    required AlertRepository alertRepository,
    required IWebSocketService webSocketService,
  })  : _alertRepository = alertRepository,
        _webSocketService = webSocketService,
        super(const AlertState()) {
    on<AddAlertEvent>(_onAddAlertHandler);
    on<AlertsRequested>(_onAlertsRequestedHandler);
    on<ConnectWebSocket>(_onConnectWebSocket);
    on<UpdatePrice>(_onUpdatePrice);
  }

  Future<void> addAlert(Alert alert) async {
    try {
      await _alertRepository.saveAlert(alert);
      add(AddAlertEvent(alert));
    } on Exception catch (e) {
      throw Exception("Failed to save alert: $e");
    }
  }

  void closeConnection() {
    _webSocketService.disconnect();
  }

  Future<List<Alert>> getAlerts() async {
    try {
      final alerts = await _alertRepository.getAlerts();

      add(AlertsRequested(alerts: alerts));

      return alerts;
    } on Exception catch (e) {
      throw Exception("Failed to get alerts: $e");
    }
  }

  Future<void> _onAddAlertHandler(
    AddAlertEvent event,
    Emitter<AlertState> emit,
  ) async {
    emit(state.copyWith(alerts: state.alerts + [event.alert]));

    _webSocketService.subscribeToStock(event.alert.stockSymbol);
  }

  FutureOr<void> _onAlertsRequestedHandler(
    AlertsRequested event,
    Emitter<AlertState> emit,
  ) {
    emit(state.copyWith(alerts: event.alerts));

    add(const ConnectWebSocket());
  }

  void _onConnectWebSocket(ConnectWebSocket event, Emitter<AlertState> emit) {
    _webSocketService.connect();

    emit(state.copyWith(isConnected: true));

    // Suscribir a los símbolos de las alertas existentes
    for (final alert in state.alerts) {
      _webSocketService.subscribeToStock(alert.stockSymbol);
    }

    _webSocketService.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'trade') {
        final trades = data['data'] as List<dynamic>;
        for (var trade in trades) {
          final symbol = trade['s'];
          final price = trade['p'];
          add(UpdatePrice(symbol: symbol, price: price));
        }
      }
    });
  }

  void _onUpdatePrice(UpdatePrice event, Emitter<AlertState> emit) {
    final updatedAlerts = state.alerts.map((alert) {
      if (alert.stockSymbol == event.symbol) {
        return alert.copyWith(
          lastPrice: event.price,
        ); // Asume una función copyWith en Alert
      }
      return alert;
    }).toList();

    emit(state.copyWith(alerts: updatedAlerts));
  }
}
