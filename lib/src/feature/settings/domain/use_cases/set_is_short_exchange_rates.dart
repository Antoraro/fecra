import '../../../../core/data/preferences/preferences.dart';

class SetIsShortExchangeRates {
  final AppPreferences _prefs;
  SetIsShortExchangeRates(this._prefs);

  Future<void> call(bool isShortExchangeRates) =>
      _prefs.setIsShortExchange(isShortExchangeRates);
}
