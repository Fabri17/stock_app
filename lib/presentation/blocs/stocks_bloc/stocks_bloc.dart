import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/stock.dart';

part 'stocks_event.dart';
part 'stocks_state.dart';

class StocksBloc extends Bloc<StocksEvent, StocksState> {
  final Future<List<Stock>> Function(String exchange) _fetchStockSymbols;

  StocksBloc({
    required Future<List<Stock>> Function(String exchange) fetchSymbols,
  })  : _fetchStockSymbols = fetchSymbols,
        super(const StocksState()) {
    on<StocksRequested>((event, emit) {
      final stocks = event.stocks;
      emit(state.copyWith(stocks: stocks));
    });
  }

  Future<List<Stock>> fetchStockSymbols(String exchange) async {
    if (state.stocks.isNotEmpty) return state.stocks;

    try {
      final stocks = await _fetchStockSymbols(exchange);
      add(StocksRequested(stocks: stocks));
      return stocks;
    } on Exception catch (e) {
      throw Exception("Failed to fetch stock symbols: $e");
    }
  }
}
