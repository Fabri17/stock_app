import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String name;
  final String symbol;
  final double price;
  final double volume;

  const Stock({
    required this.name,
    required this.symbol,
    required this.price,
    required this.volume,
  });

  copywith({
    String? name,
    String? symbol,
    double? price,
    double? volume,
  }) {
    return Stock(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      volume: volume ?? this.volume,
    );
  }

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      name: json['name'],
      symbol: json['symbol'],
      price: json['price'],
      volume: json['change'],
    );
  }

  @override
  List<Object?> get props => [name, symbol, price, volume];
}
