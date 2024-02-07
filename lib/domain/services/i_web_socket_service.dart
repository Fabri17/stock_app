abstract class IWebSocketService {
  void connect();
  void disconnect();
  void subscribeToStock(String symbol);
  void unsubscribeFromStock(String symbol);
  bool isConnectionOpen();
  Stream<dynamic> get messages;
}
