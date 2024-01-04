import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_durations.dart';
import 'preferences.dart';

class AppPreferencesImpl implements AppPreferences {
  static const String _isShortExchangeKey = 'is_short_exchange_key';
  static const String _refreshPeriodKey = 'refresh_delay_key';

  final ReplaySubject<bool> _isShortExchangeChannel = ReplaySubject(maxSize: 1);
  final ReplaySubject<int> _refreshPeriodChannel = ReplaySubject(maxSize: 1);

  final SharedPreferences _prefs;

  /// Private constructor
  ///
  AppPreferencesImpl._(this._prefs) {
    _isShortExchangeChannel.add(isShortExchange());
    _refreshPeriodChannel.add(getRefreshPeriod());
  }

  /// Public factory
  ///
  static Future<AppPreferences> instance() async {
    final prefs = await SharedPreferences.getInstance();
    final component = AppPreferencesImpl._(prefs);
    return component;
  }

  @override
  Future<bool> clear() => _prefs.clear();

  @override
  Stream<bool> get isShortExchangeStream => _isShortExchangeChannel;

  @override
  Stream<int> get refreshPeriodStream => _refreshPeriodChannel;

  @override
  Future<void> setIsShortExchange(bool value) async {
    await _prefs.setBool(_isShortExchangeKey, value);
    _isShortExchangeChannel.add(value);
  }

  @override
  Future<void> setRefreshPeriod(int value) async {
    await _prefs.setInt(_refreshPeriodKey, value);
    _refreshPeriodChannel.add(value);
  }

  @override
  bool isShortExchange() => _prefs.getBool(_isShortExchangeKey) ?? false;

  @override
  int getRefreshPeriod() =>
      _prefs.getInt(_refreshPeriodKey) ?? AppDurations.refreshPeriod.inSeconds;
}
