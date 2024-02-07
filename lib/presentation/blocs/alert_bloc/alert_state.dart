part of 'alert_bloc.dart';

class AlertState extends Equatable {
  final List<Alert> alerts;
  final bool isConnected;
  final Map<String, num> prices;

  const AlertState({
    this.alerts = const <Alert>[],
    this.isConnected = false,
    this.prices = const <String, num>{},
  });

  AlertState copyWith({
    List<Alert>? alerts,
    bool? isConnected,
    Map<String, num>? prices,
  }) {
    return AlertState(
      alerts: alerts ?? this.alerts,
      isConnected: isConnected ?? this.isConnected,
      prices: prices ?? this.prices,
    );
  }

  @override
  List<Object> get props => [alerts, isConnected, prices];
}
