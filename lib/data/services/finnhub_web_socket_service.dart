import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/services/i_web_socket_service.dart';

class FinnhubWebSocketService implements IWebSocketService {
  WebSocketChannel? _channel;
  final String _token = AppConstants.finnhubApiKey;

  @override
  void connect() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.finnhub.io?token=$_token'),
      );
    } on Exception catch (e) {
      throw ('Failed to connect to WebSocket: $e');
    }
  }

  @override
  void disconnect() {
    if (_channel != null) {
      _channel!.sink.close();
    }
  }

  @override
  Stream<dynamic> get messages => _channel!.stream;

  @override
  void subscribeToStock(String symbol) {
    _channel!.sink.add(json.encode({'type': 'subscribe', 'symbol': symbol}));
  }

  @override
  void unsubscribeFromStock(String symbol) {
    _channel!.sink.add(json.encode({'type': 'unsubscribe', 'symbol': symbol}));
  }

  @override
  bool isConnectionOpen() {
    return _channel != null;
  }
}
