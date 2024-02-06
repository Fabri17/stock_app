class Formatters {
  // Format a number to a currency string
  static String currency(num value) {
    return '\$${value.toStringAsFixed(2)}';
  }

  // Format a number to a percentage string
  static String percentage(num value) {
    return '${value.toStringAsFixed(2)}%';
  }

  // Format a number to a volume string
  static String volume(num value) {
    return value.toStringAsFixed(4);
  }

  // Format a number to a timestamp string
  static String timestamp(int value) {
    return DateTime.fromMillisecondsSinceEpoch(value).toLocal().toString();
  }

  // Format a number to a date string
  static String date(int value) {
    return DateTime.fromMillisecondsSinceEpoch(value)
        .toLocal()
        .toIso8601String();
  }

  // Format Stock symbol
  static String symbol(String value) {
    var symbol = value.split(":").last;
    if (symbol.length > 6) {
      symbol = "${symbol.substring(0, 3)} / ${symbol.substring(3)}";
    }

    return symbol;
  }
}
