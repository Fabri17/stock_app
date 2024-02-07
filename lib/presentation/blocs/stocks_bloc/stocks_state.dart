part of 'stocks_bloc.dart';

class StocksState extends Equatable {
  final List<Stock> stocks;

  const StocksState({
    this.stocks = const <Stock>[],
  });

  StocksState copyWith({
    List<Stock>? stocks,
  }) {
    return StocksState(
      stocks: stocks ?? this.stocks,
    );
  }

  @override
  List<Object> get props => [stocks];
}
