import 'package:stock_app/core/constants/constants.dart';
import 'package:stock_app/data/models/models.dart';
import 'package:dio/dio.dart';

class StockRepository {
  final String _baseUrl = AppConstants.finnhubBaseUrl;
  final String _apiKey = AppConstants.finnhubApiKey;

  Future<List<Stock>> getStockSymbols(String exchange) async {
    final dio = Dio();

    try {
      var response = await dio.get(
        '$_baseUrl/stock/symbol',
        queryParameters: {'exchange': exchange, 'token': _apiKey},
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((stock) => Stock(
                symbol: stock['symbol'], description: stock['description']))
            .toList();
      } else {
        throw Exception('Failed to load stock symbols');
      }
    } catch (e) {
      throw Exception('Failed to load stock symbols');
    }
  }
}
