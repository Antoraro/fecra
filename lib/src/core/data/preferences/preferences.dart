import 'dart:async';

abstract class AppPreferences {
  Future<bool> clear();

  Stream<bool> get isShortExchangeStream;

  Stream<int> get refreshPeriodStream;

  Future<void> setIsShortExchange(bool value);

  Future<void> setRefreshPeriod(int value);

  bool isShortExchange();

  int getRefreshPeriod();
}
