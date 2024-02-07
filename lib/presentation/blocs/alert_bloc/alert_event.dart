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
