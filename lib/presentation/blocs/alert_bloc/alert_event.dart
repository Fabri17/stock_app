part of 'alert_bloc.dart';

sealed class AlertEvent extends Equatable {
  const AlertEvent();

  @override
  List<Object> get props => [];
}

final class AddAlertEvent extends AlertEvent {
  final Alert alert;
  const AddAlertEvent(this.alert);
}

class AlertsRequested extends AlertEvent {
  final List<Alert> alerts;
  const AlertsRequested({required this.alerts});
}

class ConnectWebSocket extends AlertEvent {
  const ConnectWebSocket();

  @override
  List<Object> get props => [];
}

class UpdatePrice extends AlertEvent {
  final String symbol;
  final num price;

  const UpdatePrice({required this.symbol, required this.price});

  @override
  List<Object> get props => [symbol, price];
}
