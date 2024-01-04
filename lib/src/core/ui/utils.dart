String getRateString(bool isShortExchange, double? rate) {
  if (rate == null) {
    return '';
  } else if (isShortExchange) {
    return rate.toStringAsFixed(3);
  } else {
    return rate.toString();
  }
}
