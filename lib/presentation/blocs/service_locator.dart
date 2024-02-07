import 'package:get_it/get_it.dart';
import '../../data/repositories/stock_repository.dart';
import '../../data/services/finnhub_web_socket_service.dart';
import '../../domain/repositories/alert_repository.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(ThemeCubit());

  getIt.registerSingleton(
    StocksBloc(
      fetchSymbols: (exchange) => StockRepository().getStockSymbols(exchange),
    ),
  );

  getIt.registerSingleton(
    AlertBloc(
      alertRepository: AlertRepository(),
      webSocketService: FinnhubWebSocketService(),
    ),
  );
}
