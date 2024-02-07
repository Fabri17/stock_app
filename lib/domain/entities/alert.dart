import 'package:equatable/equatable.dart';

class Alert extends Equatable {
  final String stockSymbol;
  final num alertPrice;
  final num lastPrice;

  const Alert({
    required this.stockSymbol,
    required this.alertPrice,
    required this.lastPrice,
  });

  Alert copyWith({
    String? stockSymbol,
    num? alertPrice,
    num? lastPrice,
  }) {
    return Alert(
      stockSymbol: stockSymbol ?? this.stockSymbol,
      alertPrice: alertPrice ?? this.alertPrice,
      lastPrice: lastPrice ?? this.lastPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stockSymbol': stockSymbol,
      'alertPrice': alertPrice,
      'lastPrice': lastPrice,
    };
  }

  @override
  List<Object?> get props => [stockSymbol, alertPrice, lastPrice];
}
