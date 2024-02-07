import 'package:get_it/get_it.dart';
import 'package:stock_app/data/repositories/stock_repository.dart';
import 'package:stock_app/domain/repositories/alert_repository.dart';

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
      saveAlert: (alert) => AlertRepository().saveAlert(alert),
      getAlerts: () => AlertRepository().getAlerts(),
    ),
  );
}
