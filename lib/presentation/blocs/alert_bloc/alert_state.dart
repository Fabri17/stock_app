part of 'alert_bloc.dart';

class AlertState extends Equatable {
  final List<Alert> alerts;

  const AlertState({
    this.alerts = const <Alert>[],
  });

  AlertState copyWith({
    List<Alert>? alerts,
  }) {
    return AlertState(
      alerts: alerts ?? this.alerts,
    );
  }

  @override
  List<Object> get props => [alerts];
}
