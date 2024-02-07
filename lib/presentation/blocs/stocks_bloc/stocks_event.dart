part of 'stocks_bloc.dart';

sealed class StocksEvent extends Equatable {
  const StocksEvent();

  @override
  List<Object> get props => [];
}

class StocksRequested extends StocksEvent {
  final List<Stock> stocks;

  const StocksRequested({required this.stocks});

  @override
  List<Object> get props => [stocks];
}
