import 'package:equatable/equatable.dart';

class Alert extends Equatable {
  final String stockSymbol;
  final double alertPrice;

  const Alert({
    required this.stockSymbol,
    required this.alertPrice,
  });

  copyWith({
    String? stockSymbol,
    double? alertPrice,
  }) {
    return Alert(
      stockSymbol: stockSymbol ?? this.stockSymbol,
      alertPrice: alertPrice ?? this.alertPrice,
    );
  }

  toMap() {
    return {
      'stockSymbol': stockSymbol,
      'alertPrice': alertPrice,
    };
  }

  @override
  List<Object?> get props => [stockSymbol, alertPrice];
}
