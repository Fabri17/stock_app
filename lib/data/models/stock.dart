import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String? description;
  final String? symbol;

  const Stock({
    this.description,
    this.symbol,
  });

  copyWith({
    String? description,
    String? symbol,
  }) {
    return Stock(
      description: description ?? this.description,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  List<Object?> get props => [description, symbol];
}
