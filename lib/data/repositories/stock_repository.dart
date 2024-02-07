import '../models/models.dart';

class StockRepository {
  Future<List<Stock>> getStockSymbols(String exchange) async {
    try {
      /// This is a mock implementation of the actual API call
      /// to fetch stock symbols from the server
      /// The actual implementation would use the Dio package
      /// to make a GET request to the server
      /// and parse the response into a list of Stock objects
      /// using the Stock model

      const List<Stock> stocks = [
        Stock(symbol: 'AAPL', description: 'Apple Inc.'),
        Stock(symbol: 'GOOGL', description: 'Alphabet Inc.'),
        Stock(symbol: 'MSFT', description: 'Microsoft Corporation'),
        Stock(symbol: 'AMZN', description: 'Amazon.com Inc.'),
        Stock(symbol: 'TSLA', description: 'Tesla Inc.'),
        Stock(symbol: 'FB', description: 'Facebook Inc.'),
        Stock(symbol: 'NVDA', description: 'NVIDIA Corporation'),
        Stock(symbol: 'PYPL', description: 'PayPal Holdings Inc.'),
        Stock(symbol: 'ADBE', description: 'Adobe Inc.'),
        Stock(symbol: 'NFLX', description: 'Netflix Inc.'),
        Stock(symbol: 'BINANCE:BTCUSDT', description: 'Bitcoin'),
        Stock(symbol: 'IC MARKETS:1', description: 'Gold'),
      ];

      return stocks;
    } catch (e) {
      throw Exception('Failed to load stock symbols');
    }
  }
}
