import 'package:equatable/equatable.dart';

class Trade extends Equatable {
  final num? price;
  final String? symbol;
  final int? time;
  final num? volume;

  const Trade({this.price, this.symbol, this.time, this.volume});

  copyWith({num? price, String? symbol, int? time, num? volume}) {
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
