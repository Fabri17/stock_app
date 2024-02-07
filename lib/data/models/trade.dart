import 'package:equatable/equatable.dart';

class Trade extends Equatable {
  final double? price;
  final String? symbol;
  final int? time;
  final double? volume;

  const Trade({this.price, this.symbol, this.time, this.volume});

  copyWith({double? price, String? symbol, int? time, double? volume}) {
    return Trade(
      price: price ?? this.price,
      symbol: symbol ?? this.symbol,
      time: time ?? this.time,
      volume: volume ?? this.volume,
    );
  }

  @override
  List<Object?> get props => [price, symbol, time, volume];
}
